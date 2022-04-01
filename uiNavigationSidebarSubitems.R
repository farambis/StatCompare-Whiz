parametricSidebarItem <- function(tabName) {
  menuItem(text = 'Parametric', tabName = tabName,
                                          menuItem(text = 'Raw Data', tabName = paste0(tabName, 'RawData')),
                                          menuItem(text = 'Educational', tabName = paste0(tabName, 'Educational'))
                                 )
}
nonparametricSidebarItem <- function(tabName) {
  menuItem(text = 'Nonparametric', tabName = tabName)}

