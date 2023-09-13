library(imageRy)
library(terra)

# list files
im.list()

# import
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# layer 1 = NIR
# layer 2 = red
# layer 3 = green

par(mfrow=c(1,2))
im.plotRGB.user(m1992, r=1, g=2, b=3)
im.plotRGB.user(m2006, r=1, g=2, b=3)

# DVI Difference Vegetation Index
dvi1992 = m1992[[1]] - m1992[[2]]

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

# DVI Difference Vegetation Index
dvi2006 = m2006[[1]] - m2006[[2]]

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2006, col=cl)

# method 2
dvi1992 <- im.dvi(m1992, 1, 2)
dvi2006 <- im.dvi(m2006, 1, 2)

