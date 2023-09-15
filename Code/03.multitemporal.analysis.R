# Multitemporal analysis of ice melt in Greenland

library(imageRy)
library(terra)

# listing the available data
im.list()

# import data
g2000 <- im.import("greenland.2000.tif")
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

# plot the data altogether
cl <- colorRampPalette(c('light blue','blue','dark blue'))(100) 
par(mfrow=c(2,2))
plot(g2000, col=cl)
plot(g2005, col=cl)
plot(g2010, col=cl)
plot(g2015, col=cl)

# stack
gmulti <- c(g2000, g2005, g2010, g2015)
gmulti
plot(gmulti, col=cl)

# Exercise: plot a single layer .from the stack 
dev.off() # exit strategy in graphics
plot(gmulti[[1]], col=cl)

# maximum (lag) change in time
gdif = gmulti[[4]] - gmulti[[1]]
cldif <- colorRampPalette(c("red","pink","light blue","blue"))(100)
plot(gdif, col=cldif) 

gdifall = gmulti[[4]] - gmulti[[3]] - gmulti[[2]] - gmulti[[1]]
plot(gdifall, col=cldif) 

# RGB
im.plotRGB.user(gmulti, 1, 3, 4)
# red 2000
# green 2010
# blue 2015



cldif <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(gdif, col=cldif) 













