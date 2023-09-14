# Calculation spatial variability on remote sensing data

# R code variability

library(imageRy)
library(terra)
library(viridis)

im.list()

sent <- im.import("sentinel.png")

# band1 = NIR
# band2 = red
# band3 = green

im.plotRGB.user(sent, 1, 2, 3)

# calculation of variability over NIR
nir <- sent[[1]]

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)

viridis <- colorRampPalette(viridis(7))(255)
plot(sd3, col=viridis)


