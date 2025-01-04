app_version <- readLines('VERSION')

myHeader <- dashboardHeader(
    title = 'StatCompare Whiz',
    tags$li(
      class = 'dropdown',
      tags$span(
          style = '
          position: absolute;
          width: 100%;
          padding: 10px;
          text-align: center;
          color: #b8c7ce;',
        paste0('Version: ', app_version))
    ),
    tags$li(
      class = 'dropdown',
      tags$a(
        href = 'https://github.com/farambis/StatCompare-Whiz',
        target = '_blank',
        icon('github'),
        title = 'Link to GitHub Page Containing Source Code'
        )
    )
)
