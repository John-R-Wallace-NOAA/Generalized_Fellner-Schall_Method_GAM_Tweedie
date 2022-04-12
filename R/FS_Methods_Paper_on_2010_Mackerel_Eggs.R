
## 2010 Mackerel data as used in FS method paper. Tweddie Model predictions with random vessel
library(mgcv)
library(gamair)
library(fields)

data(coast)
data(med)
med$log.vol <- log(med$vol)
med <- na.omit(med)

?gamair

# Fit the GAM model (mgcv package) with the Fellner-Schall method ('efs') and with a Tweedie error model where the shape and scale parameters vary by bottom depth.
(gm_efs_Tweedie_rv <- mgcv::gam(list(count ~ s(lo, la, bs = "ds", m = c(1, .5), k = 150) +
         s(T.20, bs = "cr", k = 10) + s(Sal20, bs = "cr", k = 10) + 
         s(I(b.depth^.5), bs = "cr", k = 10) +  s(ship, bs = "re") + offset(log.vol), 
         ~ s(I(b.depth^.5), bs = "cr", k = 10), ~ s(I(b.depth^.5), bs = "cr", k = 10)), data = med, family = twlss(),
         control = gam.control(maxit=100), optimizer = "efs"))
anova(gm_efs_Tweedie_rv)
gam.check(gm_efs_Tweedie_rv)
AIC(gm_efs_Tweedie_rv)
dev.new(); par(mfrow = c(3,3))
plot(gm_efs_Tweedie_rv)

# Use as.image() from the fields packaage to get a values on a regular grid
med$Predict <- predict(gm_efs_Tweedie_rv)[,1]
zz <- fields::as.image(med$Predict, x = med[, c('lo', 'la')], nx = 20, ny = 20)

# image.plot() from the fields package
dev.new(height = 600, width = 500)
# image(zz$x, zz$y, zz$z, col= rev(heat.colors(32)), cex.lab=1.2, cex.axis=1.15, xlim = c(-20.5, 1), ylim = c(42, 64 ), xlab = 'Longitude', ylab = 'Latitude')
fields::image.plot(zz$x, zz$y, zz$z, col= rev(heat.colors(32)), cex.lab=1.2, cex.axis=1.15, xlim = c(-20.5, 1), ylim = c(42, 64 ), xlab = 'Longitude', ylab = 'Latitude')
contour(zz$x, zz$y, zz$z, add = TRUE)
lines(coast$lon, coast$lat, col = 'brown')


# Filled Contour plot
dev.new(height = 600, width = 500)
numLevels <- c(5, 10, 15, 20, 30, 40)[6]
plot(NA, NA, type = 'n', cex.lab=1.2, cex.axis=1.15, xlim = c(-20.5, 1), ylim = c(42, 64 ), xlab = 'Longitude', ylab = 'Latitude') 
graphics::.filled.contour(zz$x, zz$y, zz$z, levels = seq(min(zz$z, na.rm = TRUE), max(zz$z, na.rm = TRUE), length = numLevels) , col= rev(heat.colors(numLevels))) 
contour(zz$x, zz$y, zz$z, nlevels = 10, add = TRUE)
lines(coast$lon, coast$lat, col = 'brown')


# Filled Contour plot with various number of levels
dev.new(height = 700, width = 500)
par(mfrow = c(3,2))

for ( i in 1:6) {
   numLevels <- c(5, 10, 15, 20, 30, 40)[i]
   plot(NA, NA, type = 'n', cex.lab=1.2, cex.axis = 1.15, main = paste0("Number of Contour Levels: ", numLevels), xlim = c(-20.5, 1), ylim = c(42, 64 ), xlab = 'Longitude', ylab = 'Latitude') 
   graphics::.filled.contour(zz$x, zz$y, zz$z, levels = seq(min(zz$z, na.rm = TRUE), max(zz$z, na.rm = TRUE), length = numLevels) , col= rev(heat.colors(numLevels)))
   lines(coast$lon, coast$lat, col = 'brown')
}




