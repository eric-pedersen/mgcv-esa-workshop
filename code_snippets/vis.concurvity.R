# visualise concurvity between terms in a GAM
# David L Miller 2015, MIT license

# arguments:
#   b     -- a fitted gam
#   type  -- concurvity measure to plot, see ?concurvity

vis.concurvity <- function(b, type="estimate"){
  cc <- concurvity(b, full=FALSE)[[type]]

  diag(cc) <- NA
  cc[lower.tri(cc)]<-NA

  layout(matrix(1:2, ncol=2), widths=c(5,1))
  opar <- par(mar=c(5, 6, 5, 0) + 0.1)
  # main plot
  image(z=cc, x=1:ncol(cc), y=1:nrow(cc), ylab="", xlab="",
        axes=FALSE, asp=1, zlim=c(0,1))
  axis(1, at=1:ncol(cc), labels = colnames(cc), las=2)
  axis(2, at=1:nrow(cc), labels = rownames(cc), las=2)
  # legend
  opar <- par(mar=c(5, 0, 4, 3) + 0.1)
  image(t(matrix(rep(seq(0, 1, len=100), 2), ncol=2)),
        x=1:3, y=1:101, zlim=c(0,1), axes=FALSE, xlab="", ylab="")
  axis(4, at=seq(1,101,len=5), labels = round(seq(0,1,len=5),1), las=2)
  par(opar)
}
