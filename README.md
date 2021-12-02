
R code to closely recreate the analysis in the methods paper:

##### A Generalized Fellner-Schall Method for Smoothing Parameter Optimization with Application to Tweedie Location, Scale and Shape Models

##### ( https://onlinelibrary.wiley.com/doi/epdf/10.1111/biom.12666 )

A GAM model using the Fellner-Schall method (optimizer = "efs"), with a Tweedie error model where the shape and scale parameters vary by bottom depth is used.
Vessel is also included as a random variable and the volume of the net is used as an offset.
#

R packages:
- mgcv
- gamair
- fields
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
