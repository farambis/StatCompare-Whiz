# Parameter ----
col1 <- hcl(h = 120, c = 90, l = 70)
col2 <- hcl(h = 320, c = 80, l = 70)
col3 <- hcl(h = 10, c = 40, l = 70)
col4 <- hcl(h = 210, c = 40, l = 70)


col_polygon <- hcl(h = 280, c = 35, l = 90)
col_polygon2 <- hcl(h = 200, c = 35, l = 90)
density <- NULL

col_tail1 <- hcl(h = 10, c = 40, l = 70, alpha = 0.4)
col_tail2 <- hcl(h = 210, c = 40, l = 70, alpha = 0.4)

seg_col1 <- 'black'
seg_col2 <- 'black'

blank_line <- 0
solid_line <- 1
dashed_line <- 2


# Parametric plots ----
## Plot for parametric overlapping coefficient ----

generate_data_plot <- function(es_plot, x = NULL, INDEX = NULL, y = NULL, m1, m2, m3, m4, s1, s2, s3, s4, sdiff1 = NA, sdiff2 = NA, n1, n2, r1, r2, n, kernel, reference_group, tail, cutoff) {
  if (!es_plot %in% all_plots) stop("this is not an offered plot!\n")
  res <- switch(es_plot,
                "parametric_ovl" = plot_parametric_overlap(x, INDEX, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2, n = n),
                "parametric_cohens_u1" = plot_cohens_u1(x, INDEX, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2, n = n),
                "parametric_cohens_u3" = plot_cohens_u3(x, INDEX, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2, n = n),
                "tail_ratio" = plot_tail_ratio(x, INDEX, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, reference_group = reference_group, tail = tail, cutoff = cutoff),
                "tail_ratio_zoom" = plot_tail_ratio_zoom(x, INDEX, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, reference_group = reference_group, tail = tail, cutoff = cutoff),
                "parametric_PPC_change" = plot_parametric_ppc_change(x, INDEX, y, m1, s1, m2, s2, sdiff1, r1, m3, s3, m4, s4, sdiff2, r2),
                "parametric_PPC_difference" = plot_parametric_ppc_difference(x, INDEX, y, m1, s1, m2, s2, m3, s3, m4, s4),
                "parametric_PPC_interaction" = plot_parametric_ppc_interaction(x, INDEX, y, m1, s1, m2, s2, m3, s3, m4, s4, n1, n2, alpha = 0.05),
                "non_parametric_tail_ratio" = plot_non_parametric_tail_ratio(x, INDEX, y = y, reference_group = reference_group, tail = tail, cutoff = cutoff, kernel = kernel),
                "non_parametric_tail_ratio_zoom" = plot_non_parametric_tail_ratio_zoom(x, INDEX, y = y, reference_group = reference_group, tail = tail, cutoff = cutoff, kernel = kernel),
                "non_parametric_ovl" = plot_non_parametric_overlap(x, INDEX, y = y, kernel = kernel),
                "non_parametric_cohens_u1" = plot_non_parametric_u1(x, INDEX, y = y, kernel = kernel),
                "non_parametric_cohens_u3" = plot_non_parametric_u3(x, INDEX, y = y, kernel = kernel),
                "boxplot_pairwise_difference_scores" = boxplot_pairwise_difference_scores(x, INDEX, y = y)
  )
}

#generate_raw_data_plot("parametric_ovl", m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2)
plot_parametric_overlap <- function(x = NULL, INDEX = NULL, y = NULL,
                                    m1, m2, s1, s2, n1, n2, n) {
  
  group_names <- c("Group 1", "Group 2")
  measurement_names <- c("Measurement 1", "Measurement 2")
  if(!is.null(x)){
    if(!is.null(INDEX)){
      stats <- summary_stats(x = x, INDEX = INDEX)
      INDEX_fct <- factor(INDEX)
      group_names <- levels(INDEX_fct)
    } else {
      stats <- summary_stats(x = x, y = y)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  
  pooled_sd <- ifelse(!is.null(n2), sd_pooled(s1 = s1, s2 = s2, n1 = n1, n2 = n2), sd_pooled(s1 = s1, s2 = s2, n1 = n, n2 = n))
  x_from <- min(m1, m2) - 3.5 * pooled_sd
  x_to <- max(m1, m2) + 3.5 * pooled_sd
  x_length <- max(((x_to - x_from) * 2), 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m1, pooled_sd)
  y_group2 <- dnorm(x, m2, pooled_sd)
  
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- y_min
  y_to <- y_max + ((y_max - y_min) / 5)
  y <- c(y_from, y_to)
  
  ovl_x <- c(x[[1]], x, x[[length(x)]])
  ovl_y <- c(0, pmin(y_group1, y_group2), 0)
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3,4,3,0))
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(ovl_x, ovl_y, col = col_polygon, border = NA)
  lines(x, y_group1, col = col1)
  lines(x, y_group2, col = col2)
  segments(x0 = c(m1, m2), 
           x1 = c(m1, m2), 
           y0 = c(0, 0), 
           y1 = c(max(y_group1), max(y_group2)), 
           lty = c("dashed", "dotted")
  )
  title(main = "Visualisation of Cohen's d and the overlapping coefficient")
  mtext(text = "Homogeneity of variances assumed and thus pooled standard deviation is used for plotting")
  graphics::box()
  
  eff_size_labs <- c(paste0("d==~", 
                            round(
                              ifelse(
                                !is.null(n2),
                                cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2),
                                cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n, n2 = n)),
                              2)),
                     paste0("VR==~", 
                            round(variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = TRUE), 2)
                     ),
                     paste0(
                       "OVL==~",
                       round(
                         ifelse(
                           !is.null(n2),
                           parametric_ovl(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2),
                           parametric_ovl_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)),
                         2)
                     )
  )
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "dashed", "solid", "dotted"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  rect(xlef = 0, xright = 0.15, ybottom = 0.7 + (0.025/2), ytop = 0.7 - (0.025/2), col = col_polygon, border = NA)
  text(x = c(0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2), 
       y = c(1, 0.95, 0.85, 0.8, 0.7, 0.65, 0.6), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(!is.null(n2), group_names[[1]], measurement_names[[1]]),
         str2expression(text = paste0("bar(x)==~", round(m1, 2))),
         ifelse(!is.null(n2), group_names[[2]], measurement_names[[2]]),
         str2expression(text = paste0("bar(x)==~", round(m2, 2))),
         str2expression(text = eff_size_labs[[3]]),
         str2expression(text = eff_size_labs[[2]]),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}


## Plot for parametric Cohen's U1 effect measure ----

plot_cohens_u1 <- function(x = NULL, INDEX = NULL, y = NULL,
                           m1, m2, s1, s2, n1, n2, n) {
  group_names <- c("Group 1", "Group 2")
  measurement_names <- c("Measurement 1", "Measurement 2")
  if(!is.null(x)){
    if(!is.null(INDEX)){
      stats <- summary_stats(x = x, INDEX = INDEX)
      INDEX_fct <- factor(INDEX)
      group_names <- levels(INDEX_fct)
    } else {
      stats <- summary_stats(x = x, y = y)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
    
  }
  
  pooled_sd <- ifelse(!is.null(n2), sd_pooled(s1 = s1, s2 = s2, n1 = n1, n2 = n2), sd_pooled(s1 = s1, s2 = s2, n1 = n, n2 = n))
  x_from <- min(m1, m2) - 3.5 * pooled_sd
  x_to <- max(m1, m2) + 3.5 * pooled_sd
  x_length <- max(((x_to - x_from) * 2), 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m1, pooled_sd)
  y_group2 <- dnorm(x, m2, pooled_sd)
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- y_min
  y_to <- y_max + ((y_max - y_min) / 5)
  y <- c(y_from, y_to)
  
  u1_x <- c(x[[1]], x, rev(x), x[[1]])
  u1_y <- c(0, y_group1, rev(y_group2), 0)
  
  ovl2_x <- c(x[[1]], x, x[[length(x)]])
  ovl2_y <- c(0, pmin(y_group1, y_group2), 0)
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3, 4, 3, 0))
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(ovl2_x, ovl2_y, col = col_polygon, border = NA)
  polygon(u1_x, u1_y, col = col_polygon2, border = NA)
  bool <- y_group1 > y_group2
  lines(x[bool], y_group1[bool], col = col1, lwd = 1.25)
  lines(x[!bool], y_group1[!bool], col = col1, lty = dashed_line, lwd = 1.25)
  lines(x[!bool], y_group2[!bool], col = col2, lwd = 1.25)
  lines(x[bool], y_group2[bool], col = col2, lty = dashed_line, lwd = 1.25)
  segments(x0 = c(m1, m2), 
           x1 = c(m1, m2), 
           y0 = c(0, 0), 
           y1 = c(max(y_group1), max(y_group2)), 
           lty = c("dashed", "dotted")
  )
  title(main = "Visualisation of Cohen's d, OVL2, and Cohen's U1")
  mtext(text = "Homogeneity of variances assumed and thus pooled standard deviation is used for plotting")
  graphics::box()
  
  eff_size_labs <- c(paste0("d==~", 
                            round(
                              ifelse(
                                !is.null(n2),
                                cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2),
                                cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n, n2 = n)),
                              2)),
                     paste0("VR==~", 
                            round(variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = TRUE), 2)
                     ),
                     paste0(
                       "U1==~",
                       round(
                         ifelse(
                           !is.null(n2),
                           parametric_cohens_u1(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2),
                           parametric_cohens_u1_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)),
                         2)
                     ),
                     paste0(
                       "OVL2==~",
                       round(
                         ifelse(
                           !is.null(n2),
                           parametric_ovl_two(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2),
                           parametric_ovl_two_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
                         ),
                         2)
                     )
  )
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "dashed", "solid", "dotted"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  rect(xlef = 0, xright = 0.15, 
       ybottom = c(0.7 - (0.025/2), 0.65 - (0.025/2)), 
       ytop = c(0.7 + (0.025/2), 0.65 + (0.025/2)), 
       col = c(col_polygon2, col_polygon), border = NA)
  text(x = 0.2, 
       y = c(1, 0.95, 0.85, 0.8, 0.7, 0.65, 0.6, 0.55), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(!is.null(n2), group_names[[1]], measurement_names[[1]]),
         str2expression(text = paste0("bar(x)==~", round(m1, 2))),
         ifelse(!is.null(n2), group_names[[2]], measurement_names[[2]]),
         str2expression(text = paste0("bar(x)==~", round(m2, 2))),
         str2expression(text = eff_size_labs[[3]]),
         str2expression(text = eff_size_labs[[4]]),
         str2expression(text = eff_size_labs[[2]]),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}


## Plot for parametric Cohen's U3 effect measure  ----

plot_cohens_u3 <- function(x = NULL, INDEX = NULL, y = NULL,
                           m1, m2, s1, s2, n1, n2, n) {
  
  group_names <- c("Group 1", "Group 2")
  measurement_names <- c("Measurement 1", "Measurement 2")
  if(!is.null(x)){
    if(!is.null(INDEX)){
      stats <- summary_stats(x = x, INDEX = INDEX)
      INDEX_fct <- factor(INDEX)
      group_names <- levels(INDEX_fct)
    } else {
      stats <- summary_stats(x = x, y = y)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  
  eff_size_labs <- c(paste0("d==~", 
                            round(
                              ifelse(
                                !is.null(n2),
                                cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2),
                                cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n, n2 =n)),
                              2)),
                     paste0("VR==~", 
                            round(variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = TRUE), 2)
                     ),
                     paste0(
                       "U3==~",
                       round(
                         ifelse(
                           !is.null(n2),
                           parametric_cohens_u3(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2),
                           parametric_cohens_u3_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)),
                         2)
                     )
  )
  
  bool <- m1 < m2
  
  temp <- group_names
  group_names[[1]] <- temp[ifelse(bool, 2, 1)]
  group_names[[2]] <- temp[ifelse(bool, 1, 2)]
  
  temp <- measurement_names
  measurement_names[[1]] <- temp[ifelse(bool, 2, 1)]
  measurement_names[[2]] <- temp[ifelse(bool, 1, 2)]
  
  temp <- c(s1, s2)
  s1 <- temp[ifelse(bool, 2, 1)]
  s2 <- temp[ifelse(bool, 1, 2)]
  
  temp <- c(m1, m2)
  m1 <- temp[ifelse(bool, 2, 1)]
  m2 <- temp[ifelse(bool, 1, 2)]
  
  pooled_sd <- ifelse(!is.null(n2), sd_pooled(s1 = s1, s2 = s2, n1 = n1, n2 = n2), sd_pooled(s1 = s1, s2 = s2, n1 = n, n2 = n))
  x_from <- m2 - 3.5 * pooled_sd
  x_to <- m1 + 3.5 * pooled_sd
  x_length <- max(((x_to - x_from) * 2), 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m1, pooled_sd)
  y_group2 <- dnorm(x, m2, pooled_sd)
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- y_min
  y_to <- y_max + ((y_max - y_min) / 5)
  y <- c(y_from, y_to)
  
  u3_x <- c(x[[1]], x[x <= m1], m1, m1)
  u3_y <- c(0, y_group2[x <= m1], dnorm(m1, m2, s2), 0)
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3, 4, 3, 0))
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(u3_x, u3_y, col = col_polygon2, border = NA)
  lines(x, y_group1, col = col1)
  lines(x, y_group2, col = col2)
  segments(x0 = c(m1, m2), 
           x1 = c(m1, m2), 
           y0 = c(0, 0), 
           y1 = c(max(y_group1), max(y_group2)), 
           lty = c("dashed", "dotted")
  )
  title(main = "Visualisation of Cohen's d and Cohen's U3")
  mtext(text = "Homogeneity of variances assumed and thus pooled standard deviation is used for plotting")
  graphics::box()
  
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "dashed", "solid", "dotted"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  rect(xlef = 0, xright = 0.15, 
       ybottom = 0.7 - (0.025/2), 
       ytop = 0.7 + (0.025/2), 
       col = col_polygon, border = NA)
  text(x = 0.2, 
       y = c(1, 0.95, 0.85, 0.8, 0.7, 0.65, 0.6), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(!is.null(n2), group_names[[1]], measurement_names[[1]]),
         str2expression(text = paste0("bar(x)==~", round(m1, 2))),
         ifelse(!is.null(n2), group_names[[2]], measurement_names[[2]]),
         str2expression(text = paste0("bar(x)==~", round(m2, 2))),
         str2expression(text = eff_size_labs[[3]]),
         str2expression(text = eff_size_labs[[2]]),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
  
}

## Plot for parametric tail ratio (without and with zoom) ----
plot_tail_ratio <- function(x = NULL, INDEX = NULL, y = NULL,
                            m1, m2, s1, s2, n = NULL,
                            reference_group = c("group1", "group2"),
                            tail = c("lower", "upper"), 
                            cutoff) {
  
  group_names <- c("Group 1", "Group 2")
  measurement_names <- c("Measurement 1", "Measurement 2")
  if(!is.null(x)){
    if(!is.null(INDEX)){
      stats <- summary_stats(x = x, INDEX = INDEX)
      INDEX_fct <- factor(INDEX)
      group_names <- levels(INDEX_fct)
    } else {
      stats <- summary_stats(x = x, y = y)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  
  x_from <- min(m1, m2) - 3.5 * max(s1, s2)
  x_to <- max(m1, m2) + 3.5 * max(s1, s2)
  x_length <- max((x_to - x_from) * 2, 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m1, s1)
  y_group2 <- dnorm(x, m2, s2)
  
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- y_min
  y_to <- y_max + ((y_max - y_min) / 5)
  y <- c(y_from, y_to)
  
  tail_region_x_from <- ifelse(tail %in% "lower", x[[1]], cutoff)
  tail_region_x_to <- ifelse(tail %in% "lower", cutoff, x[[length(x)]])
  tail_region_x_length <- max((tail_region_x_to - tail_region_x_from) * 2, 201)
  tail_region_x <- seq(tail_region_x_from, tail_region_x_to, length.out = tail_region_x_length)
  tail_polygon_x <- c(tail_region_x_from, tail_region_x, tail_region_x_to)
  tail_polygon_y1 <- c(0, dnorm(tail_region_x, m1, s1), 0)
  tail_polygon_y2 <- c(0, dnorm(tail_region_x, m2, s2), 0)
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3,4,3,0))
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(tail_polygon_x, tail_polygon_y1, col = col_tail1, border = NA)
  polygon(tail_polygon_x, tail_polygon_y2, col = col_tail2, border = NA)
  lines(x, y_group1, col = col1)
  lines(x, y_group2, col = col2)
  segments(x0 = c(m1, m2, cutoff), 
           x1 = c(m1, m2, cutoff), 
           y0 = c(0, 0, 0), 
           y1 = c(max(y_group1), max(y_group2), max(y_group1, y_group2)), 
           lty = c("dashed", "dotted", "solid")
  )
  title(main = "Visualisation of the tail ratio and Glass' d")
  graphics::box()
  
  eff_size_labs <- c(paste0("d[G]==~", 
                            round(
                              glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = ifelse(reference_group == "group1", TRUE, FALSE)),
                              2)),
                     paste0("VR==~", 
                            round(variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = ifelse(reference_group == "group1", TRUE, FALSE)), 2)
                     ),
                     paste0(
                       "TR==~",
                       round(
                         tail_ratio(m1 = m1, m2 = m2, s1 = s1, s2 = s2, reference_group = reference_group, tail = tail, cutoff = cutoff), 2)
                     )
  )
  
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "dashed", "solid", "dotted"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  rect(xlef = 0, xright = 0.15, 
       ybottom = rep(0.7 + (0.025/2), 2), 
       ytop = rep(0.7 - (0.025/2),2),
       col = c(col_tail1, col_tail2), 
       border = NA)
  text(x = c(0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2), 
       y = c(1, 0.95, 0.85, 0.8, 0.7, 0.65, 0.6), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(!is.null(n2), group_names[[1]], measurement_names[[1]]),
         str2expression(text = paste0("bar(x)==~", round(m1, 2))),
         ifelse(!is.null(n2), group_names[[2]], measurement_names[[2]]),
         str2expression(text = paste0("bar(x)==~", round(m2, 2))),
         str2expression(text = eff_size_labs[[3]]),
         str2expression(text = eff_size_labs[[2]]),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}


plot_tail_ratio_zoom <- function(x = NULL, INDEX = NULL, y = NULL,
                                 m1, m2, s1, s2, n = NULL,
                                 reference_group = c("grp1", "grp2"),
                                 tail = c("lower", "upper"), 
                                 cutoff) {
  
  group_names <- c("Group 1", "Group 2")
  measurement_names <- c("Measurement 1", "Measurement 2")
  if(!is.null(x)){
    if(!is.null(INDEX)){
      stats <- summary_stats(x = x, INDEX = INDEX)
      INDEX_fct <- factor(INDEX)
      group_names <- levels(INDEX_fct)
    } else {
      stats <- summary_stats(x = x, y = y)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  
  x_from <- min(m1, m2) - 3.5 * max(s1, s2)
  x_from <- ifelse(tail %in% "lower", x_from, cutoff)
  x_to <- max(m1, m2) + 3.5 * max(s1, s2)
  x_to <- ifelse(tail %in% "lower", cutoff, x_to)
  x_length <- max((x_to - x_from) * 2, 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m1, s1)
  y_group2 <- dnorm(x, m2, s2)
  
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- y_min
  y_to <- y_max + ((y_max - y_min) / 5)
  y <- c(y_from, y_to)
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3,4,3,0))
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(c(x_from, x, x_to), c(0, y_group1, 0), col = col_tail1, border = NA)
  polygon(c(x_from, x, x_to), c(0, y_group2, 0), col = col_tail2, border = NA)
  lines(x, y_group1, col = col1)
  lines(x, y_group2, col = col2)
  segments(x0 = cutoff, x1 = cutoff, y0 = 0, y1 = y_to, lty = 1)
  title(main = "Zoomed-in visualisation of the tail ratio")
  graphics::box()
  
  eff_size_labs <- c(paste0("d[G]==~", 
                            round(
                              glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = ifelse(reference_group == "group1", TRUE, FALSE)),
                              2)),
                     paste0("VR==~", 
                            round(variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = ifelse(reference_group == "group1", TRUE, FALSE)), 2)
                     ),
                     paste0(
                       "TR==~",
                       round(
                         tail_ratio(m1 = m1, m2 = m2, s1 = s1, s2 = s2, reference_group = reference_group, tail = tail, cutoff = cutoff), 2)
                     )
  )
  
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.9), y1 = c(1, 0.9),
           lty = c("solid", "solid"),
           lwd = 1.25,
           col = c(col1, col2))
  rect(xlef = 0, xright = 0.15, 
       ybottom = rep(0.8 + (0.025/2), 2), 
       ytop = rep(0.8 - (0.025/2),2),
       col = c(col_tail1, col_tail2), 
       border = NA)
  text(x = c(0.2, 0.2, 0.2, 0.2, 0.2), 
       y = c(1, 0.9, 0.8, 0.75, 0.7), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(!is.null(n2), group_names[[1]], measurement_names[[1]]),
         ifelse(!is.null(n2), group_names[[2]], measurement_names[[2]]),
         str2expression(text = eff_size_labs[[3]]),
         str2expression(text = eff_size_labs[[2]]),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}


# Non-parametric plots ----
# Plots for the non-parametric tail ratio (with and without zoom) ----
plot_non_parametric_tail_ratio <- function(x = NULL, INDEX = NULL, y = NULL,
                                           reference_group = c("group1", "group2"),
                                           tail = c("lower", "upper"), 
                                           cutoff, bw = "nrd0", 
                                           kernel = c("gaussian",
                                                      "epanechnikov",
                                                      "rectangular",
                                                      "triangular",
                                                      "biweight",
                                                      "cosine",
                                                      "optcosine")) {
  
  
  if (!is.null(INDEX)) {
    original_dataset <- split(x, INDEX)
    dataset1 <- original_dataset[[1]]
    dataset2 <- original_dataset[[2]]
    tail_ratio_non_parametric <- non_parametric_tail_ratio(x, INDEX, reference_group, tail, cutoff)
    INDEX_fct <- factor(INDEX)
    group_names <- levels(INDEX_fct)
  } else if (!is.null(y)){
    dataset1 <- x
    dataset2 <- y
    tail_ratio_non_parametric <- non_parametric_tail_ratio_dependent(x, y, reference_group, tail, cutoff)
    measurement_names <- c("Measurement 1", "Measurement 2")
  }
  
  d1 <- density(dataset1, bw = bw, kernel = kernel)
  d2 <- density(dataset2, bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  
  x_min <- min(d1$x, d2$x)
  x_max <- max(d1$x, d2$x)
  y_min <- min(d1$y, d2$y)
  y_max <- max(d1$y, d2$y)
  y_max <- y_max + (y_max - y_min) / 5
  
  tail_region_x_from <- ifelse(tail %in% "lower", x_min, cutoff)
  tail_region_x_to <- ifelse(tail %in% "lower", cutoff, x_max)
  tail_region_x_length <- max((tail_region_x_to - tail_region_x_from) * 2, 201)
  tail_region_x <- seq(tail_region_x_from, tail_region_x_to, length.out = tail_region_x_length)
  tail_polygon_x <- c(tail_region_x_from, tail_region_x, tail_region_x_to)
  tail_polygon_y1 <- c(0, f1(tail_region_x), 0)
  tail_polygon_y2 <- c(0, f2(tail_region_x), 0)
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3,4,3,0))
  plot(x = c(x_min, x_max), y = c(y_min, y_max), xlab = '', ylab = '', main = "", type = 'n',
       axes = FALSE)
  axis(side = 1, round(seq(x_min, x_max, length.out = 5), digits = 2))
  axis(side = 2, round(seq(y_min, y_max, length.out = 5), digits = 3), las = 2)
  polygon(tail_polygon_x, tail_polygon_y1, col = col_tail1, border = NA, density = NULL)
  polygon(tail_polygon_x, tail_polygon_y2, col = col_tail2, border = NA, density = NULL)
  lines(d1, col = col1)
  lines(d2, col = col2)
  segments(x0 = c(mean(dataset1), mean(dataset2), cutoff), 
           x1 = c(mean(dataset1), mean(dataset2), cutoff), 
           y0 = c(0, 0, 0),
           y1 = c(f1(mean(dataset1)), 
                  f2(mean(dataset2)), 
                  max(d1$y, d2$y)),
           lty = c("dashed", "dotted", "solid"))
  rug(x = jitter(c(x,y)))
  title(main = "Visualisation of the tail ratio")
  graphics::box()
  
  eff_size_labs <- c(paste0("VR==~", 
                            round(variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = ifelse(reference_group == "group1", TRUE, FALSE)), 2)
  ),
  paste0(
    "TR==~",
    round(
      tail_ratio_non_parametric, 2)
  )
  )
  
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "dashed", "solid", "dotted"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  rect(xlef = 0, xright = 0.15, 
       ybottom = rep(0.7 + (0.025/2), 2), 
       ytop = rep(0.7 - (0.025/2),2),
       col = c(col_tail1, col_tail2), 
       border = NA)
  text(x = c(0.2, 0.2, 0.2, 0.2, 0.2, 0.2), 
       y = c(1, 0.95, 0.85, 0.8, 0.7, 0.65), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(is.null(y), group_names[[1]], measurement_names[[1]]),
         str2expression(text = paste0("bar(x)==~", round(mean(dataset1), 2))),
         ifelse(is.null(y), group_names[[2]], measurement_names[[2]]),
         str2expression(text = paste0("bar(x)==~", round(mean(dataset2), 2))),
         str2expression(text = eff_size_labs[[2]]),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}



plot_non_parametric_tail_ratio_zoom <- function(x = NULL, INDEX = NULL, y = NULL,
                                                reference_group = c("grp1", "grp2"),
                                                tail = c("lower", "upper"), 
                                                cutoff, 
                                                bw = "nrd0", 
                                                kernel = c("gaussian",
                                                           "epanechnikov",
                                                           "rectangular",
                                                           "triangular",
                                                           "biweight",
                                                           "cosine",
                                                           "optcosine")) {
  if (!is.null(INDEX)) {
    original_dataset <- split(x, INDEX)
    dataset1 <- original_dataset[[1]]
    dataset2 <- original_dataset[[2]]
    tail_ratio_non_parametric <- non_parametric_tail_ratio(x, INDEX, reference_group, tail, cutoff)
    INDEX_fct <- factor(INDEX)
    group_names <- levels(INDEX_fct)
  } else if (!is.null(y)){
    dataset1 <- x
    dataset2 <- y
    tail_ratio_non_parametric <- non_parametric_tail_ratio_dependent(x, y, reference_group, tail, cutoff)
    measurement_names <- c("Measurement 1", "Measurement 2")
  }
  
  
  
  d1 <- density(dataset1, bw = bw, kernel = kernel)
  d2 <- density(dataset2, bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  
  x_min <- min(d1$x, d2$x)
  x_min <- ifelse(tail %in% "lower", x_min, cutoff)
  x_max <- max(d1$x, d2$x)
  x_max <- ifelse(tail %in% "lower", cutoff, x_max)
  x_length <- max((x_max - x_min) * 2, 201)
  x_axis <- seq(x_min, x_max, length.out = x_length)
  y_min <- 0
  y_max <- max(f1(x_axis), f2(x_axis), na.rm = TRUE)
  y_max <- y_max + (y_max - y_min) / 5
  
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3,4,3,0))
  plot(x = c(x_min, x_max), y = c(y_min, y_max), xlab = '', ylab = '', main = "", type = 'n',
       axes = FALSE)
  axis(side = 1, round(seq(x_min, x_max, length.out = 5), digits = 2))
  axis(side = 2, round(seq(y_min, y_max, length.out = 5), digits = 3), las = 2)
  polygon(c(x_min, x_axis, x_max), c(0, f1(x_axis), 0), col = col_tail1, border = NA, density = NULL)
  polygon(c(x_min, x_axis, x_max), c(0, f2(x_axis), 0), col = col_tail2, border = NA, density = NULL)
  lines(x_axis, f1(x_axis), col = col1)
  lines(x_axis, f2(x_axis), col = col2)
  segments(x0 = cutoff, x1 = cutoff, y0 = 0, y1 = y_max, lty = 1)
  suppressWarnings(rug(x = jitter(c(x,y))))
  title(main = "Zoomed-in visualisation of the tail ratio")
  graphics::box()
  
  eff_size_labs <- c(paste0("VR==~", 
                            round(variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = ifelse(reference_group == "group1", TRUE, FALSE)), 2)
  ),
  paste0(
    "TR==~",
    round(
      tail_ratio_non_parametric, 2)
  )
  )
  
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.9), y1 = c(1, 0.9),
           lty = c("solid", "solid"),
           lwd = 1.25,
           col = c(col1, col2))
  rect(xlef = 0, xright = 0.15, 
       ybottom = rep(0.8 + (0.025/2), 2), 
       ytop = rep(0.8 - (0.025/2),2),
       col = c(col_tail1, col_tail2), 
       border = NA)
  text(x = c(0.2, 0.2, 0.2, 0.2), 
       y = c(1, 0.9, 0.8, 0.75), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(is.null(y), group_names[[1]], measurement_names[[1]]),
         ifelse(is.null(y), group_names[[2]], measurement_names[[2]]),
         str2expression(text = eff_size_labs[[2]]),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}

## Plot for non-parametric overlap coefficient ----
plot_non_parametric_overlap <- function(x = NULL, INDEX = NULL, y = NULL,
                                        bw = "nrd0",
                                        kernel = c(
                                          "gaussian",
                                          "epanechnikov",
                                          "rectangular",
                                          "triangular",
                                          "biweight",
                                          "cosine",
                                          "optcosine")) {
  intervals <- 1000
  if (!is.null(INDEX)) {
    original_dataset <- split(x, INDEX)
    dataset1 <- original_dataset[[1]]
    dataset2 <- original_dataset[[2]]
    INDEX_fct <- factor(INDEX)
    group_names <- levels(INDEX_fct)
  } else if (!is.null(y)){
    dataset1 <- x
    dataset2 <- y
    measurement_names <- c("Measurement 1", "Measurement 2")
  }
  
  d1 <- density(dataset1, bw = bw, kernel = kernel)
  d2 <- density(dataset2, bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  
  x_min <- min(d1$x, d2$x)
  x_max <- max(d1$x, d2$x)
  y_min <- min(d1$y, d2$y)
  y_max <- max(d1$y, d2$y)
  y_max <- y_max + (y_max - y_min) / 5
  
  ovl_x <- seq(x_min, x_max, length.out = intervals)
  ovl_y <- pmin(f1(ovl_x), f2(ovl_x))
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3,4,3,0))
  plot(x = c(x_min, x_max), y = c(y_min, y_max), xlab = '', ylab = '', main = "", type = 'n',
       axes = FALSE)
  axis(side = 1, round(seq(x_min, x_max, length.out = 5), digits = 2))
  axis(side = 2, round(seq(y_min, y_max, length.out = 5), digits = 3), las = 2)
  polygon(c(x_min, ovl_x, x_max),
          c(0, ovl_y, 0), border = NA,
          col = col_polygon,
          density = NULL)
  lines(d1, col = col1)
  lines(d2, col = col2)
  segments(x0 = c(mean(dataset1), mean(dataset2)), 
           x1 = c(mean(dataset1), mean(dataset2)), 
           y0 = c(0, 0), 
           y1 = c(f1(mean(dataset1)), f2(mean(dataset2))), 
           lty = c("dashed", "dotted")
  )
  rug(jitter(c(x,y)))
  title(main = "Visualisation of the overlapping coefficient")
  graphics::box()
  
  eff_size_labs <- paste0(
    "OVL==~",
    round(
      non_parametric_ovl <- non_parametric_ovl(x = x, INDEX = INDEX, y = y, bw = bw, kernel = kernel),2)
  )
  
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "dashed", "solid", "dotted"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  rect(xlef = 0, xright = 0.15, ybottom = 0.7 + (0.025/2), ytop = 0.7 - (0.025/2), col = col_polygon, border = NA)
  text(x = c(0.2, 0.2, 0.2, 0.2, 0.2), 
       y = c(1, 0.95, 0.85, 0.8, 0.7), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(is.null(y), group_names[[1]], measurement_names[[1]]),
         str2expression(text = paste0("bar(x)==~", round(mean(dataset1), 2))),
         ifelse(is.null(y), group_names[[2]], measurement_names[[2]]),
         str2expression(text = paste0("bar(x)==~", round(mean(dataset2), 2))),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}


## Plot for nonparametric Cohen's U1 effect measure ----
plot_non_parametric_u1 <- function(x = NULL, INDEX = NULL,  y = NULL,
                                   bw = "nrd0",
                                   kernel = c(
                                     "gaussian",
                                     "epanechnikov",
                                     "rectangular",
                                     "triangular",
                                     "biweight",
                                     "cosine",
                                     "optcosine")) {
  if (!is.null(INDEX)) {
    original_dataset <- split(x, INDEX)
    dataset1 <- original_dataset[[1]]
    dataset2 <- original_dataset[[2]]
    INDEX_fct <- factor(INDEX)
    group_names <- levels(INDEX_fct)
  } else if (!is.null(y)){
    dataset1 <- x
    dataset2 <- y
    measurement_names <- c("Measurement 1", "Measurement 2")
  }
  
  d1 <- density(dataset1, bw = bw, kernel = kernel)
  d2 <- density(dataset2, bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  x_min <- min(d1$x, d2$x)
  x_max <- max(d1$x, d2$x)
  y_min <- min(d1$y, d2$y)
  y_max <- max(d1$y, d2$y)
  y_max <- y_max + (y_max - y_min) / 5
  
  ovl2_x <- c(x_min, seq(x_min, x_max, len = max(((x_min - x_max) * 2), 201)), x_max)
  ovl2_y <- pmin(f1(ovl2_x), f2(ovl2_x))
  
  u1_x <- c(d1$x, rev(d2$x))
  u1_y <- c(c(d1$y, rev(d2$y)))
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3,4,3,0))
  plot(x = c(x_min, x_max), y = c(y_min, y_max), xlab = '', ylab = '', main = "", type = 'n',
       axes = FALSE)
  
  axis(side = 1, round(seq(x_min, x_max, length.out = 5), digits = 2))
  axis(side = 2, round(seq(y_min, y_max, length.out = 5), digits = 3), las = 2)
  polygon(ovl2_x, ovl2_y, border = NA, col = col_polygon2, density = NULL)
  polygon(u1_x, u1_y, border = NA, col = col_polygon, density = NULL)
  lines(d1, col = col1)
  lines(d2, col = col2)
  segments(x0 = c(mean(dataset1), mean(dataset2)), 
           x1 = c(mean(dataset1), mean(dataset2)), 
           y0 = c(0, 0), 
           y1 = c(f1(mean(dataset1)), f2(mean(dataset2))), 
           lty = c("dashed", "dotted")
  )
  rug(jitter(c(x,y)))
  title(main = "Visualisation of OVL2 and Cohen's U1")
  graphics::box()
  
  eff_size_labs <- c(paste0(
    "U1==~",
    round(non_parametric_cohens_u1(x = x, INDEX = INDEX, y = y, kernel = kernel), 2)
  ),
  paste0(
    "OVL2==~",
    round(non_parametric_ovl_two(x = x, INDEX = INDEX, y = y, kernel = kernel), 2)
  )
  )
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "dashed", "solid", "dotted"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  rect(xlef = 0, xright = 0.15, 
       ybottom = c(0.7 - (0.025/2), 0.65 - (0.025/2)), 
       ytop = c(0.7 + (0.025/2), 0.65 + (0.025/2)), 
       col = c(col_polygon2, col_polygon), border = NA)
  text(x = 0.2, 
       y = c(1, 0.95, 0.85, 0.8, 0.7, 0.65), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(is.null(y), group_names[[1]], measurement_names[[1]]),
         str2expression(text = paste0("bar(x)==~", round(mean(dataset1), 2))),
         ifelse(is.null(y), group_names[[2]], measurement_names[[2]]),
         str2expression(text = paste0("bar(x)==~", round(mean(dataset2), 2))),
         str2expression(text = eff_size_labs[[2]]),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}







## Plot for Mann-Whitney-U based effect measures ----
boxplot_pairwise_difference_scores <- function(x = NULL, INDEX = NULL, y = NULL) {
  if (!is.null(INDEX)) {
    original_dataset <- split(x, INDEX)
    dataset1 <- original_dataset[[1]]
    dataset2 <- original_dataset[[2]]
  } else if (!is.null(y)){
    dataset1 <- x
    dataset2 <- y
  }
  difference_scores <- list()
  for (i in dataset1)
    for (j in dataset2) {
      difference_scores <- c(difference_scores, i - j)
    }
  myseq <- seq(0, 2, 2 / (length(difference_scores) - 1))
  plot(myseq, difference_scores, xaxt = 'n', type = 'n', xlab = '', ylab = 'Difference Scores')
  for (i in difference_scores)
    boxplot(i, add = TRUE, ylab = '', axes = FALSE)
  title(main = 'Boxplot of all pairwise difference scores')
  legend(x = 0, xjust = 0, y = max(unlist(difference_scores)), yjust = 1,
         bty = "n",
         legend = "Difference of a single pairwise comparison", col = "black", lty = 1)
}

## Plot for non-parametric Cohen's U3 effect measure ----
plot_non_parametric_u3 <- function(x = NULL, INDEX = NULL, y = NULL,
                                   bw = "nrd0",
                                   kernel = c(
                                     "gaussian",
                                     "epanechnikov",
                                     "rectangular",
                                     "triangular",
                                     "biweight",
                                     "cosine",
                                     "optcosine")) {
  if (!is.null(INDEX)) {
    original_dataset <- split(x, INDEX)
    dataset1 <- original_dataset[[1]]
    dataset2 <- original_dataset[[2]]
    INDEX_fct <- factor(INDEX)
    group_names <- levels(INDEX_fct)
  } else {
    dataset1 <- x
    dataset2 <- y
    measurement_names <- c("Measurement 1", "Measurement 2")
  }
  eff_size_labs <- c(paste0(
    "U3==~",
    round(non_parametric_cohens_u3(x = x, INDEX = INDEX, y = y),2)
  )
  )
  
  bool <- median(dataset1) < median(dataset2)
  if (bool) {
    tmp <- dataset1
    dataset1 <- dataset2
    dataset2 <- tmp
  }
  if (!is.null(INDEX)) {
    temp <- group_names
    group_names[[1]] <- temp[ifelse(bool, 2, 1)]
    group_names[[2]] <- temp[ifelse(bool, 1, 2)]
  } else {
    temp <- measurement_names
    measurement_names[[1]] <- temp[ifelse(bool, 2, 1)]
    measurement_names[[2]] <- temp[ifelse(bool, 1, 2)]
  }
  
  d1 <- density(dataset1, bw = bw, kernel = kernel)
  d2 <- density(dataset2, bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  
  x_min <- min(d1$x, d2$x)
  x_max <- max(d1$x, d2$x)
  y_min <- min(d1$y, d2$y)
  y_max <- max(d1$y, d2$y)
  y_max <- y_max + (y_max - y_min) / 5
  median_region_x <- seq(x_min, median(dataset1), length.out = 1000)
  u3_x <- c(0, median_region_x, median(dataset1))
  u3_y <- c(0, f2(median_region_x), 0)
  
  
  layout(matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(4,1))
  par.old <- par(mar = c(3,4,3,0))
  plot(x = c(x_min, x_max), y = c(y_min, y_max), xlab = '', ylab = '', main = "", type = 'n',
       axes = FALSE)
  axis(side = 1, round(seq(x_min, x_max, length.out = 5), digits = 2))
  axis(side = 2, round(seq(y_min, y_max, length.out = 5), digits = 3), las = 2)
  polygon(u3_x, u3_y, col = col_polygon2, border = NA, density = NULL)
  segments(x0 = c(median(dataset2), median(dataset1)),
           x1 = c(median(dataset2), median(dataset1)),
           y0 = 0,
           y1 = c(f2(median(dataset2)), f1(median(dataset1))),
           lty = c("dashed", "solid"))
  lines(d1, col = col1)
  lines(d2, col = col2)
  rug(jitter(c(x,y)))
  title(main = "Visualisation of OVL2 and Cohen's U1")
  graphics::box()
  
  
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "solid", "solid", "dashed"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  rect(xlef = 0, xright = 0.15, 
       ybottom = c(0.7 - (0.025/2)), 
       ytop = c(0.7 + (0.025/2)), 
       col = c(col_polygon2, col_polygon), border = NA)
  text(x = 0.2, 
       y = c(1, 0.95, 0.85, 0.8, 0.7), 
       adj = c(0, 0.5),
       labels = c(
         ifelse(is.null(y), group_names[[1]], measurement_names[[1]]),
         str2expression(text = paste0("Med(x)==~", round(median(dataset1), 2))),
         ifelse(is.null(y), group_names[[2]], measurement_names[[2]]),
         str2expression(text = paste0("Med(x)==~", round(median(dataset2), 2))),
         str2expression(text = eff_size_labs[[1]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}

# Mixed design (PPC-design) plots ----

plot_parametric_ppc_difference <- function(x = NULL, INDEX = NULL, y = NULL,
                                           m1, s1, m2, s2, m3, s3, m4, s4) {
  
  group_names <- c("Group 1", "Group 2")
  measurement_names <- c("Pretest", "Posttest")
  if(!is.null(x) && !is.null(y) && !is.null(INDEX)){
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
    INDEX_fct <- factor(INDEX)
    group_names <- levels(INDEX_fct)
  }
  
  x_from <- min(m1, m2, m3, m4) - (3.5 * max(s1, s2, s3, s4))
  x_to <- max(m1, m2, m3, m4) + 3.5 * max(s1, s2, s3, s4)
  x_length <- max(((x_to - x_from) * 2), 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1_pre <- dnorm(x, m1, s1)
  y_group1_post <- dnorm(x, m2, s2)
  y_group2_pre <- dnorm(x, m3, s3)
  y_group2_post <- dnorm(x, m4, s4)
  
  
  y_min <- min(y_group1_pre, y_group1_post, y_group2_pre, y_group2_post)
  y_max <- max(y_group1_pre, y_group1_post, y_group2_pre, y_group2_post)
  y_from <- 0
  y_to <- y_max + ((y_max - y_min) / 5)
  y <- c(y_from, y_to)
  
  ovl_group1_x <- c(x[[1]], x, x[[length(x)]])
  ovl_group1_y <- c(0, pmin(y_group1_pre, y_group1_post), 0)
  
  ovl_group2_x <- c(x[[1]], x, x[[length(x)]])
  ovl_group2_y <- c(0, pmin(y_group2_pre, y_group2_post), 0)
  
  layout(mat = matrix(c(1, 2, 3, 3), ncol = 2, byrow = FALSE), widths = c(4, 1))
  par.old <- par(mar = c(2.5,4,2,0))
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(ovl_group1_x, ovl_group1_y, col = col_polygon, border = NA)
  lines(x, y_group1_pre, col = col1)
  lines(x, y_group1_post, col = col2)
  segments(x0 = c(m1, m2), x1 = c(m1, m2), y0 = c(0, 0), y1 = c(max(y_group1_pre), max(y_group1_post)), lty = c("dashed", "dotted"))
  title(main = paste0("Pre- and posttest scores of ", group_names[[1]]))
  
  
  par(mar = c(2.5, 4, 2, 0))
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(ovl_group2_x, ovl_group2_y, col = col_polygon, border = NA)
  lines(x, y_group2_pre, col = col3)
  lines(x, y_group2_post, col = col4)
  segments(x0 = c(m3, m4), x1 = c(m3, m4), y0 = c(0, 0), y1 = c(max(y_group2_pre), max(y_group2_post)), lty = c("dashed", "dotted"))
  title(main = paste0("Pre- and posttest scores of ", group_names[[2]]))
  
  eff_size_labs <- c(paste0("d[list(PPC, pre)]==~", round(d_PPC_pre(m1 = m1, s1 = s1, m2 = m2, m3 = m3, s3 = s3, m4 = m4), 2)),
                     paste0("d[list(G, pre)]==~", round((m2 - m1)/s1, 2)),
                     paste0("d[list(G, pre)]==~", round((m4 - m3)/s3, 2)))
  par(mar = c(2.5, 0.5, 3, 0))
  plot(c(0,1), c(0, 1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1= 0.15,
           y0 = c(0.85, 0.8, 0.75, 0.7, 0.25, 0.2, 0.15, 0.1), 
           y1 = c(0.85, 0.8, 0.75, 0.7, 0.25, 0.2, 0.15, 0.1),
           col = c(col1, "black", col2, "black", col3, "black", col4, "black"), 
           lwd = 1.25, 
           lty = c("solid", "dashed", "solid", "dotted", "solid", "dashed", "solid", "dotted"))
  text(x = c(0, 0.20, 0.2, 0.20, 0.2, 0.00, 0.20, 0.2, 0.20, 0.2, 0.00), 
       y = c(1, 0.85, 0.8, 0.75, 0.7, 0.65, 0.25, 0.2, 0.15, 0.1, 0.05), adj = c(0, 0.5),
       labels = c(str2expression(text = eff_size_labs[[1]]),
                  measurement_names[[1]],
                  str2expression(text = paste0("bar(x)[pre]==~", round(m1, 2))),
                  measurement_names[[2]],
                  str2expression(text = paste0("bar(x)[post]==~", round(m2, 2))),
                  str2expression(text = eff_size_labs[[2]]),
                  measurement_names[[1]],
                  str2expression(text = paste0("bar(x)[pre]==~", round(m3, 2))),
                  measurement_names[[2]],
                  str2expression(text = paste0("bar(x)[post]==~", round(m4, 2))),
                  str2expression(text = eff_size_labs[[3]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}




plot_parametric_ppc_change <- function(x = NULL, INDEX = NULL, y = NULL,
                                       m1, s1, m2, s2, sdiff1 = NA, r1, m3, s3, m4, s4, sdiff2 = NA, r2) {
  
  group_names <- c("Group 1", "Group 2")
  if(!is.null(x) && !is.null(y) && !is.null(INDEX)){
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
    INDEX_fct <- factor(INDEX)
    group_names <- levels(INDEX_fct)
  }
  
  m_diff_group1 <- m2 - m1
  m_diff_group2 <- m4 - m3
  if (is.na(sdiff1)) sdiff1 <- sd_diff(s1, s2, r1)
  if (is.na(sdiff2)) sdiff2 <- sd_diff(s3, s4, r2)
  
  x_from <- min(m_diff_group1, m_diff_group2) - (3.5 * max(sdiff1, sdiff2))
  x_to <- max(m_diff_group1, m_diff_group2) + 3.5 * max(sdiff1, sdiff2)
  x_length <- max(((x_to - x_from) * 2), 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m_diff_group1, sdiff1)
  y_group2 <- dnorm(x, m_diff_group2, sdiff2)
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- 0
  y_to <- y_max + ((y_max - y_min) / 5)
  y <- c(y_from, y_to)
  
  ovl_x <- c(x[[1]], x, x[[length(x)]])
  ovl_y <- c(0, pmin(y_group1, y_group2), 0)
  
  layout(mat = matrix(c(1, 2), ncol = 2, byrow = TRUE), widths = c(4, 1))
  
  par.old <- par(mar = c(3, 4, 3, 0))
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(ovl_x, ovl_y, col = col_polygon, border = NA)
  lines(x, y_group1, col = col1)
  lines(x, y_group2, col = col2)
  segments(x0 = c(m_diff_group1, m_diff_group2), 
           x1 = c(m_diff_group1, m_diff_group2), 
           y0 = c(0, 0), 
           y1 = c(max(y_group1), max(y_group2)), 
           lty = c("dashed", "dotted")
  )
  title(expression(paste("Visualising ", d["PPC-change"])))
  graphics::box()
  
  eff_size_lab <- paste0("d[PPC-change]:~", round(d_PPC_change(m1 = m1, m2 = m2, sdiff1 = sdiff1, m3 = m3, m4 = m4, sdiff2 = sdiff2), 2))
  par(mar = c(3, 0.5, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  segments(x0 = 0, x1 = 0.15,
           y0 = c(1, 0.95, 0.85, 0.8), y1 = c(1, 0.95, 0.85, 0.8),
           lty = c("solid", "dashed", "solid", "dotted"),
           lwd = 1.25,
           col = c(col1, "black", col2, "black"))
  text(x = c(0.2, 0.2, 0.2, 0.2, 0), 
       y = c(1, 0.95, 0.85, 0.8, 0.7), adj = c(0, 0.5),
       labels = c(
         group_names[[1]],
         str2expression(text = paste0("bar(x)==~", round(m_diff_group1, 2))),
         group_names[[2]],
         str2expression(text = paste0("bar(x)==~", round(m_diff_group2 ,2))),
         str2expression(text = eff_size_lab)),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}


plot_parametric_ppc_interaction <- function(x = NULL, INDEX = NULL, y = NULL,
                                            m1, s1, m2, s2, m3, s3, m4, s4, n1, n2, alpha = 0.05) {
  
  measurement_names <- c("Pretest", "Posttest")
  group_names <- c("Group 1", "Group 2")
  if(!is.null(x) && !is.null(y) && !is.null(INDEX)){
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
    INDEX_fct <- factor(INDEX)
    group_names <- levels(INDEX_fct)
  }
  
  ci_m1 <- m1 + c(qt(alpha/2, df = n1), abs(qt(alpha/2, df = n1))) * s1/sqrt(n1)
  ci_m2 <- m2 + c(qt(alpha/2, df = n1), abs(qt(alpha/2, df = n1))) * s2/sqrt(n1)
  ci_m3 <- m3 + c(qt(alpha/2, df = n1), abs(qt(alpha/2, df = n2))) * s3/sqrt(n2)
  ci_m4 <- m4 + c(qt(alpha/2, df = n1), abs(qt(alpha/2, df = n2))) * s4/sqrt(n2)
  
  x <- c(0.75, 2.25)
  y_from <- min(ci_m1, ci_m2, ci_m3, ci_m4) - diff(range(ci_m1, ci_m2, ci_m3, ci_m4))/10
  y_to <- max(ci_m1, ci_m2, ci_m3, ci_m4) + diff(range(ci_m1, ci_m2, ci_m3, ci_m4))/10
  y <- c(y_from, y_to)
  
  layout(mat = matrix(c(1,2), ncol = 2, byrow = TRUE), widths = c(3,1))
  par.old <-par(mar = c(3, 4, 3, 0))
  plot(x = x, y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = c(1,2), label = measurement_names, cex.axis = 1.25)
  axis(side = 2, at = round(seq(floor(y_from), ceiling(y_to), length.out = 6), digits = 2), las = 2, cex.axis = 1.25)
  lines(x = c(1, 2) - c(0.05, 0.05), y = c(m1, m2), col = col1, lty = "dashed", lwd = 2)
  lines(x = c(1, 2) + c(0.05, 0.05), y = c(m3, m4), col = col2, lty = "dashed", lwd = 2)
  points(x = c(1,1,2,2) + c(-0.05, 0.05, -0.05, 0.05), y= c(m1, m3, m2, m4), col = c(col1, col2, col1, col2), pch = 19, cex = 2)
  segments(x0 = c(1, 1, 2, 2) + c(-0.05, 0.05, -0.05, 0.05), 
           x1 = c(1, 1, 2, 2) + c(-0.05, 0.05, -0.05, 0.05), 
           y0 = c(ci_m1[[1]], ci_m3[[1]], ci_m2[[1]], ci_m4[[1]]), 
           y1 = c(ci_m1[[2]], ci_m3[[2]], ci_m2[[2]], ci_m4[[2]]),
           col = c(col1, col2, col1, col2), lwd = 2)
  segments(x0 = rep(1:2, each = 4) + rep(c(-0.065, 0.035), each = 2, times = 2),
           x1 = rep(1:2, each = 4) + rep(c(-0.035, 0.065), each = 2, times = 2),
           y0 = c(ci_m1, ci_m3, ci_m2, ci_m4),
           y1 = c(ci_m1, ci_m3, ci_m2, ci_m4), 
           col = rep(c(col1, col2), each = 2, times = 2),
           lwd = 2)
  title(main = "Interaction plot for the PPC design")
  graphics::box()
  
  par(mar = c(3, 0, 3, 0))
  plot(c(0,1), c(0,1), type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  points(x = c(0.075, 0.075), y = c(0.975, 0.825),
         col = c(col1, col2),
         pch = 19)
  segments(x0 = 0.075, x1 = 0.075,
           y0 = c(1, 0.85), y1 = c(0.95, 0.8),
           lwd = 1.25,
           col = c(col1, col2, "black"))
  text(x = c(0.2, 0.2), y = c(0.975, 0.825), adj = c(0, 0.5),
       labels = c(paste0("Means and\n95% CI of ", group_names[[1]]),
                  paste0("Means and\n95% CI of ", group_names[[2]])),
       cex = 1.25)
  par(par.old)
  layout(mat = 1)
}

