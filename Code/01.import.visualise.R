# import and visualise data

# install package
devtools::install_github("ducciorocchini/imageRy")

# look at the data inside
im.list()

# [19] "sentinel.dolomites.b2.tif"                         
# [20] "sentinel.dolomites.b3.tif"                         
# [21] "sentinel.dolomites.b4.tif"                         
# [22] "sentinel.dolomites.b8.tif" 

# import data
b2 <- im.import("sentinel.dolomites.b2.tif")
b3 <- im.import("sentinel.dolomites.b3.tif")
b4 <- im.import("sentinel.dolomites.b4.tif")
b8 <- im.import("sentinel.dolomites.b8.tif")

# stack everything altogether
sentsass <- c(b2, b3, b4, b8)

# visualise
im.plotRGB(sentsass)

im.plotRGB.user(sentsass, 4, 3, 2)
