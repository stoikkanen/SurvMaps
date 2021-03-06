#' Prepare your data and spatial data for SurvMapper
#'
#' @param data Your data that you want to include in the map, including the variable GEO_ID with the correct codes
#' @param geo Your geometry data, currently only works for SpatialPolygonDataframes (see the EU/EEA)

#' @keywords map
#' @export
#' @examples
#' 
#' # load the included dummy data
#' load(system.file("extdata", "dummy_data.rds", package = "SurvMaps"))
#' # load the included EU/EEA SpatialPolygonsDataframe (includes Asia and Africa for background)
#' load(system.file("extdata", "EU_AFR_AS_plgs.rds", package = "SurvMaps"))
#' 
#' mymap <- PrepMap(data = dummy_data , geo = plg_map)

PrepMap <- function(data, geo){
  geo@data[["id"]] <- rownames(geo@data)
  geo@data   <- merge(geo@data, data, by="GEO_ID", all.x=TRUE)
  z     <- broom::tidy(geo)
  z    <- merge(z,geo@data, by="id", all.x=TRUE)
  return(z)}