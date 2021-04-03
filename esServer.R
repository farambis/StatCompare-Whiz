esServer <- function(input, output) {
  generalServer("independentGroupsParametricUnivariateRawData",
                "indGrps",
                "rawData")
  generalServer("independentGroupsParametricUnivariateEducational", 
               "indGrps", 
               "educational")
  generalServer("dependentGroupsNonparametric", 
                "depGrps", 
                "rawData"
                )
  generalServer("independentGroupsNonparametric", 
                "indGrps", 
                "rawData")
}
