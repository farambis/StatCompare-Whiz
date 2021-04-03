esServer <- function(input, output) {
  
  #independent Groups
  generalServer("independentGroupsParametricUnivariateRawData",
                "indGrps",
                "rawData")
  generalServer("independentGroupsParametricUnivariateEducational", 
               "indGrps", 
               "educational")
  generalServer("independentGroupsNonparametric", 
                "indGrps", 
                "rawData", 
                "nonparametric")
  
  #dependent Groups
  generalServer("dependentGroupsParametricRawData", 
                "depGrps", 
                "rawData")
  generalServer("dependentGroupsdependentGroupsParametricEducational", 
                "depGrps", 
                "educational")
  generalServer("dependentGroupsNonparametric", 
                "depGrps", 
                "rawData", 
                "nonparametric"
                )
  
  #mixed Desing
  
}
