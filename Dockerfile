# Base image
FROM rocker/tidyverse:4.1.0

# Install R packages

#RUN R -e "install.packages(c('shiny', 'shinydashboard', 'shinyvalidate', 'DT', 'mvtnorm', 'gt'), repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('shiny',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyvalidate',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('mvtnorm',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('gt',dependencies=TRUE, repos='http://cran.rstudio.com/')"

EXPOSE 3838

COPY ./app /app
WORKDIR /app

CMD ["R", "-e", "shiny::runApp('/app')"]


