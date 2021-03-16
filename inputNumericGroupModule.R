numericInputGroup <-
  function(ns,
           group = c("mean", "standard deviation"),
           design = c("indGrps", "depGrps", "mixed"),
           value) {
    group_capitalized <- toupper(substr(x = group, start = 1, stop = 1))
    numericInputs <- list()
    numericInputs[[1]] <-
      numericInput(
        inputId = vapply(paste0(group, "1"), ns, character(1)),
        label = paste0(
          "Select the ",
          group,
          " of ",
          ifelse(
            design == "indGrps",
            "group a",
            ifelse(
              design == "depGrps",
              "pretest scores",
              "pretest scores of group a"
            )
          ),
          ":"
        ),
        value = value
      )
    
    numericInputs[[2]] <-
      numericInput(
        inputId = vapply(paste0(group, "2"), ns, character(1)),
        label = paste0(
          "Select the ",
          group,
          " of ",
          ifelse(
            design == "indGrps",
            "group b",
            ifelse(
              design == "depGrps",
              "posttest scores",
              "posttest scores of group a"
            )
          ),
          ":"
        ),
        value = value
      )
    
    if (design == "mixed") {
      numericInputs[[3]] <-
        numericInput(
          inputId = vapply(paste0(group, "3"), ns, character(1)),
          label = paste0("Select the",
                         group,
                         "of pretest scores of group b:"),
          value = value
        )
      
      numericInputs[[4]] <-
        numericInput(
          inputId = vapply(paste0(group, "4"), ns, character(1)),
          label = paste0("Select the",
                         group,
                         "of posttest scores of group b:"),
          value = value
        )
      
    }
    
    n <- length(numericInputs)
    group_capitalized <- group
    substr(group_capitalized, 1, 1) <-
      toupper(substr(group_capitalized, 1, 1))
    
    return(numericInputs)
  }