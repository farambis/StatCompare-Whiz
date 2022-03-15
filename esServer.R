esServer <- function(input, output) {
  
  #independent Groups
  generalServer(id  = "independentGroupsParametricUnivariateRawData",
                design = "indGrps",
                mode = "rawData")
  generalServer(id = "independentGroupsParametricUnivariateEducational", 
                design = "indGrps", 
                mode = "educational")
  generalServer(id = "independentGroupsNonparametric", 
                design = "indGrps", 
                mode = "rawData", 
                assumption = "nonparametric")
  
  #dependent Groups
  generalServer(id = "dependentGroupsParametricRawData", 
                design = "depGrps", 
                mode = "rawData")
  generalServer(id = "dependentGroupsParametricEducational", 
                design = "depGrps", 
                mode = "educational")
  generalServer(id = "dependentGroupsNonparametric", 
                design = "depGrps", 
                mode = "rawData", 
                assumption = "nonparametric")
  
  #mixed Design
  generalServer(id = "mixedDesignParametricRawData",
                design = "mixed",
                mode = "rawData")
  generalServer(id = "mixedDesignParametricEducational",
                design = "mixed",
                mode = "educational")
  generalServer(id = "mixedDesignNonParametric",
                design = "mixed",
                mode = "rawData",
                assumption = "nonparametric")
  
}
