# make soap pred grid

library(mapdata)
library(maptools)
library(rgeos)
library(rgdal)
library(mgcv)

load("mexdolphins.RData")

lcc_proj4 <- CRS("+proj=lcc +lat_1=20 +lat_2=60 +lat_0=40 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs ")

usmap <- map('usa', plot=FALSE, xlim=c(-100,-80), ylim=c(22,33))
uspoly <- map2SpatialPolygons(usmap, IDs=usmap$names,
                              proj4string=CRS("+proj=longlat +datum=WGS84"))

# simplify the polygon
uspoly <- gSimplify(uspoly, 0.08)


# bounding box
c1 = cbind(c(-97.5, -82, -82, -97.5),
           c(22.5, 22.5, 32, 32))
r1 = rbind(c1, c1[1, ])  # join
P1 = Polygon(r1)
Ps1 = Polygons(list(P1), ID = "a")

SPs = SpatialPolygons(list(Ps1),proj4string=CRS("+proj=longlat +datum=WGS84"))

# plot to check we got the right area
#plot(uspoly)#, xlim=c(-100,-80), ylim=c(22,33))
#plot(SPs, add=TRUE)
#points(mexdolphins[,c("longitude","latitude")])

# take the polygon difference
soap_area <- gDifference(SPs,uspoly)
# again check
#plot(soap_area)
#points(mexdolphins[,c("longitude","latitude")])


xy_bnd <- spTransform(soap_area, CRSobj=lcc_proj4)
xy_bnd <- xy_bnd@polygons[[1]]@Polygons[[1]]@coords
xy_bnd <- list(x=xy_bnd[,1], y=xy_bnd[,2])

gr <- expand.grid(x=seq(min(xy_bnd$x), max(xy_bnd$x), by=16469.27),
                  y=seq(min(xy_bnd$y), max(xy_bnd$y), by=16469.27))
x <- gr[,1]
y <- gr[,2]
ind <- inSide(xy_bnd, x, y)

soap_preddata <- as.data.frame(gr[ind,])
soap_preddata$area <- preddata$area[1]
soap_preddata$off.set <- log(soap_preddata$area)


save(xy_bnd, soap_preddata, file="soapy.RData")



