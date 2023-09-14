# unsupervised classification via k-means and land cover change estimate

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

# listing files in imageRy
im.list()

# import matogrosso
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg") 

# classification

# 1992
# 1. get values of the image
val1992 <- values(m1992)
val1992 

# 2. cluster
k1992 <- kmeans(val1992, centers = 2)
k1992
k1992$cluster

# 3. build final map
m1992c <- setValues(m1992[[1]], k1992$cluster) # assign new values to a raster object
m1992c
plot(m1992c)

# class 1 = forest
# class 2 = agriculture

# 2006
# 1. get values of the image
val2006 <- values(m2006)
val2006

# 2. cluster
k2006 <- kmeans(val2006, centers = 2)
k2006
k2006$cluster

# 3. build final map
m2006c <- setValues(m2006[[1]], k2006$cluster) # assign new values to a raster object
m2006c
plot(m2006c)

# class 1 = forest
# class 2 = agriculture

# estimate frequencies
freq1992 <- freq(m1992c)
freq2006 <- freq(m2006c)

freq1992
freq2006

totpix1992 = 1500 * 1200
perc1992 = freq1992 * 100 / totpix1992 
perc1992

totpix2006 = 3000 * 2400
perc2006 = freq2006 * 100 / totpix2006 
perc2006

# build dataframe for plotting frequencies
cover <- c("Forest","Agriculture") 
p1992 <- c(89.83, 10.16) # numbers can change
p2006 <- c(52.06, 47.93) # numbers can change

p <- data.frame(cover, p1992, p2006)
p

# final plot
library(ggplot2)
p1 <- ggplot(p, aes(x=cover, y=p1992, color=cover)) + geom_bar(stat="identity", fill="white") 
p2 <- ggplot(p, aes(x=cover, y=p2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1+p2 # library patchwork needed

# putting the same range
p1 <- ggplot(p, aes(x=cover, y=p1992, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(p, aes(x=cover, y=p2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))

p1+p2 # library patchwork needed

