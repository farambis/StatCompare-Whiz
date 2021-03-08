parametric_sidebar_item <- function(tabName, advanced = FALSE ) {
  if (advanced) return (menuItem(text = 'Parametric', tabName = tabName,
          menuItem(text = 'Univariate', tabName = paste(tabName, 'Univariate', sep = "")),
          menuItem(text = 'Multivariate', tabName = paste(tabName, 'Multivariate', sep = ""))))
  menuItem(text = 'Parametric', tabName = tabName)
}

nonparametric_sidebar_item <- function(tabName) {
  menuItem(text = 'Nonparametric', tabName = tabName)}