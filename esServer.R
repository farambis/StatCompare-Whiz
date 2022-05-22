esServer <- function(input, output) {

  #independent Groups
  generalServer(id = "independentGroupsParametricRawData",
                design = "indGrps",
                mode = "rawData")
  generalServer(id = "independentGroupsParametricEducational",
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

  #multivariate Design
  generalServer(id = "multivariateRawData",
                design = "multivariate",
                mode = "rawData",
                assumption = "parametetric")
  generalServer(id = "multivariateEducational",
                design = "multivariate",
                mode = "educational",
                assumption = "parametric")

}
