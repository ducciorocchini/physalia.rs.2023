# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

library(terra)
library(imageRy)

# refresh the imageRy package to get new fresh data
im.refresh()

# list 
im.list()

g2000 <- im.import("greenland.2000.tif")
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

# par
par(mfrow=c(2,2))
plot(g2000)
plot(g2005)
plot(g2010)
plot(g2015)

# stack
gmulti <- c(g2000, g2005, g2010, g2015)
gmulti

cl <- colorRampPalette(c('light blue','blue','dark blue'))(100) 
plot(gmulti,col=cl)

plot(gmulti,col=cl)

# RGB space
im.plotRGB.user(gmulti, 1, 2, 3)

# Difference of two images in time
gdif = g2015 - g2000
cldif <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(gdif, col=cldif)
