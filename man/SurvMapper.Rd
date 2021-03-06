% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SurvMapper.R
\name{SurvMapper}
\alias{SurvMapper}
\title{Map your prepared data with SurvMapper}
\usage{
SurvMapper(data, fills, long = long, lat = lat, id = id, isEEA = isEEA,
  CNTR_ID = CNTR_ID, Legend_titles, col_scale, fill_levels = NULL,
  reverse_colours = FALSE)
}
\arguments{
\item{data}{Your spatial data that you want to map, currently only chloropleth available}

\item{fills}{Your column/variable(s) that your want to map. Preferably a factor in defined order.}

\item{long}{Your longitude variable, defaults to 'long'}

\item{lat}{Your latitude variable, defaults to 'lat'}

\item{id}{Your id variable, defaults to 'id'}

\item{isEEA}{Your isEEA variable, defaults to 'isEEA'}

\item{CNTR_ID}{Your CNTR_ID variable, defaults to 'CNTR_ID'}

\item{Legend_titles}{Legend title(s). More than one if more than one fills.}

\item{col_scale}{Colour scale, use 'green', 'red', 'blue' or 'qualitative'. Note that the last category is always "No data" grey.
More than one if more than one fills.}

\item{fill_levels}{The order to map the levels in fills; only works with one fills variable.}

\item{reverse_colours}{Reverse the order of the colour scale. Note that the last category is always "No data" grey.}
}
\description{
Creates surveillance chloropleth maps. Note that due to the use of grid for legend and the small inlets for non-visible 
countries, mapping is not superswift and elements appear one by one to the graph. Also, the alignment of the legend, 
as well as fontsize depends on the width x height. Current ideal dimensions approximately 1000x680.
Currently uses 'Arial' font, to be updated to 'Tahoma'.
}
\examples{

# load the included dummy data
load(system.file("extdata", "dummy_data.rds", package = "SurvMaps"))
# load the included EU/EEA SpatialPolygonsDataframe (includes Asia and Africa for background)
load(system.file("extdata", "EU_AFR_AS_plgs.rds", package = "SurvMaps"))

# Prepare the data for SurvMapper with PrepMap
mymap <- PrepMap(data = dummy_data , geo = plg_map)

# The map is correctly aligned only for selected width/height, so you can plot into a predefined device
dev.new(width=11.8,height=8, noRStudioGD = TRUE)

# Simple chloropleth map
SurvMapper(mymap, fills ="Dummy_status", Legend_titles = "Testing this", col_scale = "red")

# Chloropleth map with some additional options
SurvMapper(mymap, fills ="Dummy_status", Legend_titles = "Testing this", 
       fill_levels = c("Dummy1",
                       "Dummy2",
                       "Dummy3", 
                       "Dummy4",
                       "No data"),
       col_scale = "red", reverse_colours = TRUE)

# Note that you can map at once several columns, but all options are not yet available for this scenario - 
# e.g. level order is good to be predefined if plotting several columns. And depends on graphical device (e.g. recording)
SurvMapper(mymap, fills = c("Dummy_status", "Dummy2"), Legend_titles = c("Testing this", "And also this"),
       col_scale = c("blue", "qualitative"))
}
\author{
Tommi Karki
}
\keyword{map}
