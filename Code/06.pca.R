# Multivariate analysis on remote sensing data

librry(terra)
library(imageRy)
library(viridis) # for the final plot

im.list()

b2 <- im.import("sentinel.dolomites.b2.tif")
b3 <- im.import("sentinel.dolomites.b3.tif")
b4 <- im.import("sentinel.dolomites.b4.tif")
b8 <- im.import("sentinel.dolomites.b8.tif")

sentdo <- c(b2, b3, b4, b8)

im.plotRGB.user(sentdo, 4, 3, 2)


# PCA
# 1. sample
sample <- spatSample(sentdo, 100)
sample

# 2. perform pca
pca <- prcomp(sample)

# variance explained
summary(pca)

# correlation with original bands
pca

# 3. pca map
pci <- predict(sentdo, pca, index=c(1:4))

viridis <- colorRampPalette(viridis(7))(255)
plot(pci, col=viridis)
