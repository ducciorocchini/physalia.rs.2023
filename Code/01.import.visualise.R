# import and visualise data

# install package
devtools::install_github("ducciorocchini/imageRy")

# libraries
library(imageRy)
library(terra)

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


# simple operation
10 + 10

# this is an object
duccio <- 10 + 10
duccio

# objects
adam <- 5 + 3
duccio + adam

# arrays
diameter <- c(100, 10, 50, 20, 15)
iron <- c(10, 1000, 20, 700, 900)

# a function
plot(iron, diameter) # iron and diameter are arguments!
plot(iron, diameter, pch=19) # https://www.google.com/search?client=ubuntu-sn&hs=Ssn&sca_esv=564367827&channel=fs&sxsrf=AB5stBhOTkEGpHkLRMvuoUQuTCdqYjKtEw:1694448980289&q=pch+in+R&tbm=isch&source=lnms&sa=X&ved=2ahUKEwjzmr2s-qKBAxUOGuwKHUdlAnMQ0pQJegQIDBAB&biw=960&bih=484&dpr=2#imgrc=lUw3nrgRKV8ynM
plot(iron, diameter, pch=19, cex=2)
plot(iron, diameter, pch=19, cex=2, col="red")

# do you want info about functions?
?plot()

# now we will use a package
im.list()

# importing data
b2 <- im.import("sentinel.dolomites.b2.tif") # b2 is the blue wavelength
b2

b3 <- im.import("sentinel.dolomites.b3.tif") # b2 is the green wavelength
b3

b4 <- im.import("sentinel.dolomites.b4.tif") # b2 is the green wavelength
b4

b8 <- im.import("sentinel.dolomites.b8.tif") # b2 is the green wavelength
b8

sentdo <- c(b2, b3, b4, b8)

plot(b2) # blue

cl <- colorRampPalette(c("dark blue", "blue", "light blue")) (100) # 100 is the amount of colours in the gradient
plot(b2, col=cl)

# stack everything altogether
sentsass <- c(b2, b3, b4, b8)

# visualise
im.plotRGB(sentsass)

im.plotRGB.user(sentsass, 4, 3, 2)
