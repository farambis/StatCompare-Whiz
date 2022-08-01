summaryStatisticsTableUI <- function(id, design) {
  ns <- NS(id)
  generatedUi <- tagList()
  if (design == "multivariate") {
    generatedUi$firstRow <- fluidRow(column(width=6, gt_output(ns("summary_table1"))), 
                                     column(width=6, gt_output(ns("summary_table2"))))
  } else if (design =="indGrps"){
    generatedUi$firstRow <- fluidRow(gt_output(ns("summary_table1")))
  } else if (design =="depGrps") {
    generatedUi$firstRow <- fluidRow(column(width=6, gt_output(ns("summary_table1"))), 
                                     column(width=6, gt_output(ns("summary_table2"))))
  } else {
    generatedUi$firstRow <- fluidRow(column(width=6, gt_output(ns("summary_table1"))),
                                     column(width=6, gt_output(ns("summary_table2"))))
    generatedUi$secondRow <- fluidRow(hr())
    generatedUi$thirdRow <- fluidRow(column(width=6, gt_output(ns("summary_table3"))),
                                      column(width=6, gt_output(ns("summary_table4"))))
  }
  return(generatedUi)
}


summaryStatisticsTableServer <- function(id, design, x, INDEX, y){
  moduleServer(id,
               function(input, output, session){
                 num_tbl <- switch(design,
                                   indGrps = 1,
                                   depGrps = 2,
                                   mixed = 4,
                                   multivariate = 2)
                 
                 summary_stats_dfs <- reactive({
                   generate_summary_statistics_data_frame(x = x(), INDEX = INDEX(), y = y(), design=design)
                   })
                 
                 lapply(1:num_tbl,
                        function(i){
                          output[[paste0("summary_table", i)]] <- 
                            render_gt({
                              req(summary_stats_dfs())
                              summary_stats_dfs()[[i]][[1]]%>%
                                gt(rownames_to_stub = TRUE) %>%
                                tab_header(title = summary_stats_dfs()[[i]][[2]])  %>%
                                tab_stubhead(label = "Statistics") %>%
                                tab_style(style = cell_text(align = "left"), 
                                          locations = cells_stub())})
                          }
                        
                 )
               })
}