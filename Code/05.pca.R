# how to make multivariate analysis in R with remote sensing data

library(terra)
library(imageRy)
library(viridis) # for the final plot

im.list()

b2 <- im.import("sentinel.dolomites.b2.tif")  
b3 <- im.import("sentinel.dolomites.b3.tif")  
b4 <- im.import("sentinel.dolomites.b4.tif")  
b8 <- im.import("sentinel.dolomites.b8.tif")  

sentdo <- c(b2, b3, b4, b8)

im.plotRGB.user(sentdo, 4, 3, 2)

pairs(sentdo)

# PCA

# 1. Sample
sample <- spatSample(sentdo, 100)
sample

# 2. PCA
pca <- prcomp(sample)

# variance explained
summary(pca)

# 3. PCA map
pcmap <- predict(sentdo, pca, index=c(1:4))
viridis <- colorRampPalette(viridis(7))(255)
plot(pcmap, col=viridis)

magma <- colorRampPalette(magma(7))(255)
plot(pcmap, col=magma)



