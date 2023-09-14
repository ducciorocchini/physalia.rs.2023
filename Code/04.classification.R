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
# 1. get training sets
val1992 <- values(m1992)

# 2. cluster
k1992 <- kmeans(val1992, centers = 2)

# 3. build final map
m1992c <- setValues(m1992[[1]], k1992$cluster) # assign new values to a raster object

# 2006
# 1. get training sets
val2006 <- values(m2006)

# 2. cluster
k2006 <- kmeans(val2006, centers = 2)

# 3. build final map
m2006c <- setValues(m2006[[1]], k2006$cluster) # assign new values to a raster object


# estimate frequencies
freq1992 <- freq(m1992c)
freq2006 <- freq(m2006c)

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
