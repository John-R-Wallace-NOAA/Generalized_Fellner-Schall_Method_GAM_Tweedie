
R code to closely recreate the analysis in the methods paper:

##### A Generalized Fellner-Schall Method for Smoothing Parameter Optimization with Application to Tweedie Location, Scale and Shape Models

##### ( https://onlinelibrary.wiley.com/doi/epdf/10.1111/biom.12666 )

A GAM model using the Fellner-Schall method [ mgcv::gam(..., optimizer = "efs") ], with a Tweedie error model [ mgcv::gam(..., family = twlss()) ] where the shape and scale parameters vary by squareroot of bottom depth [ mgcv::gam(list(count ~ ..., ~ s(I(b.depth^.5), bs = "cr", k = 10), ~ s(I(b.depth^.5), bs = "cr", k = 10)), ...) ].
Vessel is also included as a random variable [ mgcv::gam(list(count ~ ... +  s(ship, bs = "re") + ...), ...) ] and the log 
volume of the net [ mgcv::gam(list(count ~ ... + offset(log.vol) + ...), ...) ] is used as an offset.
#
~ s(I(b.depth^.5), bs = "cr", k = 10), ~ s(I(b.depth^.5), bs = "cr", k = 10)
R packages:
- mgcv
 ``` r
 Generalized additive (mixed) models, some of their extensions and other generalized ridge regression with
 multiple smoothing parameter estimation by (Restricted) Marginal Likelihood, Generalized Cross Validation
 and similar, or using iterated nested Laplace approximation for fully Bayesian inference. See Wood (2017)
 <doi:10.1201/9781315370279> for an overview.  Includes a gam() function, a wide variety of smoothers, 'JAGS'
 support and distributions beyond the exponential family.

 ``` 
- gamair
``` r
Data sets and scripts used in the book 'Generalized Additive Models: An Introduction with R', Wood
(2006,2017) CRC.
``` 

- fields
``` r
For curve, surface and function fitting with an emphasis on splines, spatial data, geostatistics, and
spatial statistics. The major methods include cubic, and thin plate splines, Kriging, and compactly supported
covariance functions for large data sets. ...
```

#

Additional figures beyond those in the paper are looked at.

Mackerel eggs 2010, gam.check() figure:

![Mackerel Eggs 2010, gam.check() Figure](2010_Mackerel_Eggs_Figures/Figures/Mackerel_Eggs_2010_gam.check_Figure.png)
# 
Mackerel eggs 2010, plot.gam() figure:

![Mackerel Eggs 2010, plot.gam() Figure](2010_Mackerel_Eggs_Figures/Figures/Mackerel_Eggs_2010_plot.gam()_Figure.png)
# 
Mackerel eggs 2010, fields image.plot():

![Mackerel Eggs 2010, fields image.plot()](2010_Mackerel_Eggs_Figures/Figures/Mackerel_Eggs_2010_fields_image.plot().png)
#
Mackerel eggs 2010, .filled.contour() figure:

![](2010_Mackerel_Eggs_Figures/Figures/Mackerel_Eggs_2010_.filled.contour()_Figure.png)
# 
Mackerel eggs 2010, .filled.contour() with various contour levels:

![](2010_Mackerel_Eggs_Figures/Figures/Mackerel_Eggs_2010_.filled.contour()_Various_Levels.png)
# 
