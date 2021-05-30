source("function_ready.R")

m1 <- 100
m2 <- 110
s1 <- 10
s2 <- 15
n1 <- 20
n2 <- 10
vals <- c(rnorm(n1, m1, s1), rnorm(n2, m2, s2))
grp <- factor(rep(1:2, times = c(n1, n2)))

#Parameter
col1 <- hcl(h = 10, c = 40, l = 70)
col2 <- hcl(h = 210, c = 40, l = 70)

col_polygon <- hcl(h = 280, c = 35, l = 70)
density <- NULL

col_tail1 <- hcl(h = 10, c = 40, l = 70, alpha = 0.4)
col_tail2 <- hcl(h = 210, c = 40, l = 70, alpha = 0.4)


# Parametric plots ----
## Parametric overlap plot ----


plot_parametric_overlap <- function(x, INDEX,
                                    m1, m2, s1, s2, n1, n2){
  
  if(!missing(x) && !missing(y)){

    univar_stats <- smd_stats(x, INDEX, type = "univariate")
    for(i in names(univar_stats)){
      assign(i, univar_stats[[i]])
    }
    s1 <- sqrt(var1)
    s2 <- sqrt(var2)
  }
  
  x_from <- min(m1, m2) - (3.5 * max(s1, s2))
  x_to <- max(m1, m2) + 3.5 * max(s1, s2)
  x_length <- max(((x_to -  x_from) * 2), 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m1, s1)
  y_group2 <- dnorm(x, m2, s2)
  
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- y_min
  y_to <- y_max + ((y_max - y_min)/5)
  y <- c(y_from, y_to)
  
  ovl_x <- c(x[[1]], x, x[[length(x)]])
  ovl_y <- c(0,pmin(y_group1, y_group2), 0)
  
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(ovl_x, ovl_y, col = col_polygon, border = NA)
  lines(x, y_group1, col = col1)
  lines(x, y_group2, col = col2)
  segments(x0 = c(m1, m2), x1 = c(m1, m2), y0 = c(0, 0), y1 = c(max(y_group1), max(y_group2)), lty = "dashed")
  legend(x = x_from, xjust = 0, y = y_to, yjust = 1,
         col = c(col1, col2, "white", col_polygon),
         pch = 15,
         legend = c("Group 1",
                    "Group 2",
                    paste0("d = ", round(smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = s1^2, var2 = s2^2, n1 = n1, n2 = n2), 2)),
                    paste0("OVL = ", round(ovl_parametric(m1 = m1, m2 = m2, var1 = s1^2, var2 = s2^2, n1 = n1, n2 = n2), 2))),
         bty = "n")
}                                                                                                                                 


## Parametric tail ratio plots (without and with zoom) ----
plot_parametric_tr <- function(x, INDEX , m1, m2, s1, s2, ref = c("grp1", "grp2"),
                               tail = c("lower", "upper"), cutoff){
  
  if(!missing(x) && !missing(INDEX)){

    univar_stats <- smd_stats(x, INDEX, type = "univariate")
    for(i in names(univar_stats)){
      assign(i, univar_stats[[i]])
    }
    s1 <- sqrt(var1)
    s2 <- sqrt(var2)
  }
  
  x_from <- min(m1, m2) - 3.5 * max(s1, s2)
  x_to <- max(m1, m2) + 3.5 * max(s1, s2)
  x_length <- max((x_to -  x_from) * 2, 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m1, s1)
  y_group2 <- dnorm(x, m2, s2)
  
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- y_min
  y_to <- y_max + ((y_max - y_min)/5)
  y <- c(y_from, y_to)
  
  tail_region_x_from <- ifelse(tail %in% "lower", x[[1]], cutoff)
  tail_region_x_to <- ifelse(tail %in% "lower", cutoff, x[[length(x)]])
  tail_region_x_length <- max((tail_region_x_to - tail_region_x_from) * 2, 201)
  tail_region_x <- seq(tail_region_x_from, tail_region_x_to, length.out = tail_region_x_length)
  tail_polygon_x <- c(tail_region_x_from, tail_region_x, tail_region_x_to)
  tail_polygon_y1 <- c(0, dnorm(tail_region_x, m1, s1), 0)
  tail_polygon_y2 <- c(0,dnorm(tail_region_x, m2, s2), 0)
  
  
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(tail_polygon_x, tail_polygon_y1, col = col_tail1, border = NA)
  polygon(tail_polygon_x, tail_polygon_y2, col = col_tail2, border = NA)
  lines(x, y_group1, col = col1)
  lines(x, y_group2, col = col2)
  segments(x0 = c(m1, m2, cutoff), x1 = c(m1, m2, cutoff), y0 = c(0, 0, 0), 
           y1 = c(max(y_group1), max(y_group2), max(y_group1, y_group2)),
           lty = c("dashed", "dashed", "solid"))
  legend(x = x_from, xjust = 0, y = y_to, yjust = 1,
         col = "white",
         pch = 15,
         legend = c(paste0("Cutoff = ", cutoff),
                    paste0("d = ", round(smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = s1^2, var2 = s2^2, n1 = n1, n2 = n2), 2)),
                    paste0("VR = ", round(variance_ratio(s1 = s1, s2 = s2, ref = ref), 2)),
                    paste0("TR = ", round(parametric_tr(m1 = m1, m2 = m2, s1 = s1, s2 = s2, ref = ref, tail = tail, cutoff = cutoff), 2))),
         bty = "n")
  
  
}





plot_parametric_tr_zoom <- function(x, INDEX, m1, m2, s1, s2, n1, n2, ref = c("grp1", "grp2"),
                                    tail = c("lower", "upper"), cutoff){
  
  if(!missing(x) && !missing(INDEX)){

    univar_stats <- smd_stats(x, INDEX, type = "univariate")
    for(i in names(univar_stats)){
      assign(i, univar_stats[[i]])
    }
    s1 <- sqrt(var1)
    s2 <- sqrt(var2)
  }
  
  x_from <- min(m1, m2) - 3.5 * max(s1, s2)
  x_from <- ifelse(tail %in% "lower", x_from, cutoff)
  x_to <- max(m1, m2) + 3.5 * max(s1, s2)
  x_to <- ifelse(tail %in% "lower", cutoff, x_to)
  x_length <- max((x_to -  x_from) * 2, 201)
  x <- seq(x_from, x_to, length.out = x_length)
  
  y_group1 <- dnorm(x, m1, s1)
  y_group2 <- dnorm(x, m2, s2)
  
  
  y_min <- min(y_group1, y_group2)
  y_max <- max(y_group1, y_group2)
  y_from <- y_min
  y_to <- y_max + ((y_max - y_min)/5)
  y <- c(y_from, y_to)
  
  plot(x = range(x), y, type = "n", axes = FALSE, xlab = "", ylab = "", main = "")
  axis(side = 1, at = round(seq(x_from, x_to, length.out = 5), digits = 2))
  axis(side = 2, at = round(seq(y_from, y_to, length.out = 5), digits = 3), las = 2)
  polygon(c(x_from, x, x_to), c(0, y_group1, 0), col = col_tail1, border = NA)
  polygon(c(x_from, x, x_to), c(0, y_group2, 0), col = col_tail2, border = NA)
  lines(x, y_group1, col = col1)
  lines(x, y_group2, col = col2)
  segments(x0 = cutoff, x1 = cutoff, y0 = 0, y1 = y_to, lty = 1)
  legend(x = ifelse(tail %in% "lower", x_from, x_to), 
         xjust = ifelse(tail %in% "lower", 0, 1), 
         y = y_to, 
         yjust = 1,
         col = "white",
         pch = 15,
         legend = c(paste0("Cutoff = ", cutoff),
                    paste0("d = ", round(smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = s1^2, var2 = s2^2, n1 = n1, n2 = n2), 2)),
                    paste0("VR = ", round(variance_ratio(s1 = s1, s2 = s2, ref = ref), 2)),
                    paste0("TR = ", round(parametric_tr(m1 = m1, m2 = m2, s1 = s1, s2 = s2, ref = ref, tail = tail, cutoff = cutoff), 2))),
         bty = "n")
  
  
  
} 




# Non-parametric plots ----
# non-parametric tail ratio plots (with and without plots) ----
plot_non_parametric_tr <- function(x, INDEX, ref = c("grp1", "grp2"), tail = c("lower", "upper"), cutoff, bw = "nrd0", kernel = c(
  "gaussian",
  "epanechnikov",
  "rectangular",
  "triangular",
  "biweight",
  "cosine",
  "optcosine")){
  
  
  dat <- split(x, INDEX)
  d1 <- density(dat[[1]], bw = bw, kernel = kernel)
  d2 <- density(dat[[2]], bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  min <- ifelse(tail %in% "lower", max(min(d1$x), min(d2$x)), cutoff)
  max <- ifelse(tail %in% "lower", cutoff, min(max(d1$x), max(d2$x)))
  
  x_min <- min(d1$x, d2$x)
  x_max <- max(d1$x, d2$x)  
  y_min <- min(d1$y, d2$y)
  y_max <- max(d1$y, d2$y)
  y_max <- y_max + (y_max - y_min)/5
  
  tail_region_x_from <- ifelse(tail %in% "lower", x_min, cutoff)
  tail_region_x_to <- ifelse(tail %in% "lower", cutoff, x_max)
  tail_region_x_length <- max((tail_region_x_to - tail_region_x_from) * 2, 201)
  tail_region_x <- seq(tail_region_x_from, tail_region_x_to, length.out = tail_region_x_length)
  tail_polygon_x <- c(tail_region_x_from, tail_region_x, tail_region_x_to)
  tail_polygon_y1 <- c(0, f1(tail_region_x), 0)
  tail_polygon_y2 <- c(0, f2(tail_region_x), 0)
  
  plot(x = c(x_min, x_max), y = c(y_min, y_max), xlab = '', ylab = '', main = "", type = 'n',
       axes = FALSE)
  axis(side = 1, round(seq(x_min, x_max, length.out = 5), digits = 2))
  axis(side = 2, round(seq(y_min, y_max, length.out = 5), digits = 3), las = 2)
  polygon(tail_polygon_x, tail_polygon_y1, col = col_tail1, border = NA, density = NULL)
  polygon(tail_polygon_x, tail_polygon_y2, col = col_tail2, border = NA, density = NULL)
  lines(d1, col = col1)
  lines(d2, col = col2)
  segments(x0 = c(mean(dat[[1]]), mean(dat[[2]]), cutoff), x1 = c(mean(dat[[1]]), mean(dat[[2]]), cutoff), y0 = c(0, 0, 0), 
           y1 = c(f1(mean(dat[[1]])), f2(mean(dat[[2]])), max(d1$y, d2$y)),
           lty = c("dashed", "dashed", "solid"))
  legend(x = x_min, xjust = 0, y = y_max, yjust = 1,
         col = "white",
         pch = 15,
         legend = c(paste0("Cutoff = ", cutoff),
                    paste0("d = ", round(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX), 2)),
                    paste0("VR = ", round(variance_ratio(x = x, INDEX), 2)),
                    paste0("TR = ", round(non_parametric_tr(x, INDEX, ref, tail, cutoff, bw, kernel), 2))),
         bty = "n")
  
  
}


plot_non_parametric_tr_zoom <- function(x, INDEX, ref = c("grp1", "grp2"), tail = c("lower", "upper"), cutoff, bw = "nrd0", kernel = c(
  "gaussian",
  "epanechnikov",
  "rectangular",
  "triangular",
  "biweight",
  "cosine",
  "optcosine")){
  dat <- split(x, INDEX)
  d1 <- density(dat[[1]], bw = bw, kernel = kernel)
  d2 <- density(dat[[2]], bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  min <- ifelse(tail %in% "lower", max(min(d1$x), min(d2$x)), cutoff)
  max <- ifelse(tail %in% "lower", cutoff, min(max(d1$x), max(d2$x)))
  
  
  
  x_min <- min(d1$x, d2$x)
  x_min <- ifelse(tail %in% "lower", x_min, cutoff)
  x_max <- max(d1$x, d2$x) 
  x_max <- ifelse(tail %in% "lower", cutoff, x_max)
  x_length <- max((x_max - x_min) * 2, 201)
  x_axis <- seq(x_min, x_max, length.out = x_length)
  y_min <- 0
  y_max <- max(f1(x_axis), f2(x_axis), na.rm = TRUE)
  y_max <- y_max + (y_max - y_min)/5
  
  
  plot(x = c(x_min, x_max), y = c(y_min, y_max), xlab = '', ylab = '', main = "", type = 'n',
       axes = FALSE)
  axis(side = 1, round(seq(x_min, x_max, length.out = 5), digits = 2))
  axis(side = 2, round(seq(y_min, y_max, length.out = 5), digits = 3), las = 2)
  polygon(c(x_min, x_axis, x_max), c(0, f1(x_axis), 0), col = col_tail1, border = NA, density = NULL)
  polygon(c(x_min, x_axis, x_max), c(0, f2(x_axis), 0), col = col_tail2, border = NA, density = NULL)
  lines(x_axis, f1(x_axis), col = col1)
  lines(x_axis, f2(x_axis), col = col2)
  segments(x0 = cutoff, x1 = cutoff, y0 = 0, y1 = y_max, lty = 1)
  legend(x = ifelse(tail %in% "lower", x_min, x_max), 
         xjust = ifelse(tail %in% "lower", 0, 1), 
         y = y_max, 
         yjust = 1,
         legend = c(paste0("Cutoff = ", cutoff),
                    paste0("d = ", round(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX), 2)),
                    paste0("VR = ", round(variance_ratio(x = x, INDEX), 2)),
                    paste0("TR = ", round(non_parametric_tr(x, INDEX, ref, tail, cutoff, bw, kernel), 2))),
         bty = "n")
  
}

