parametricSidebarItem <- function(tabName, advanced = FALSE ) {
  if (advanced) return (menuItem(text = 'Parametric', tabName = tabName,
                                 menuItem(text = 'Univariate', tabName = paste(tabName, 'Univariate', sep = ""), 
                                          menuItem(text = 'Raw Data', tabName = paste(tabName, 'Univariate', 'RawData', sep = "")), 
                                          menuItem(text = 'Educational', tabName = paste(tabName, 'Univariate', 'Educational', sep = ""))),
                                 menuItem(text = 'Multivariate', tabName = paste(tabName, 'Multivariate', sep = ""), 
                                          menuItem(text = 'Raw Data', tabName = paste(tabName, 'Multivariate', 'RawData', sep = "")),   
                                          menuItem(text = 'Educational', tabName = paste(tabName, 'Multivariate', 'Educational', sep = "")))))
  menuItem(text = 'Parametric', tabName = tabName, 
           menuItem(text = 'Raw Data', tabName = paste(tabName, 'RawData', sep = "")),   
           menuItem(text = 'Educational', tabName = paste(tabName, 'Educational', sep = ""))
  )
}
nonparametricSidebarItem <- function(tabName) {
  menuItem(text = 'Nonparametric', tabName = tabName)}