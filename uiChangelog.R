changelogContent <- 
  fluidPage(
    fluidRow(
      column(
        width = 10,
        offset = 1,
        html(
          "
          <article style = 'text-align:justify; text-justify:inter-word; font-size:16px; font-family:'Arial', Sans-Serif; line-height: 1.5em;'>
            <h1 style = 'text-align:center; font-family:'Arial', Sans-Serif;'>Changelog</h1>
            <br>
            <ul>
              <li>Version 1.0.2: Minor fixes in application behaviour and formatting of 'Effect Size Reference' pages:</li>
              <ul>
                <li>Fixed bug breaking the rendering of tail ratio plots for independent groups</li>
                <li>Fixed filtering of NA values in the Multivariate Measures Raw Data page</li>
                <li>Fixed bug with computing the mann whitney U test for independent groups</li>
                <li>Continued fixes of function equation rendering issues in 'Effect Size Reference' pages</li>
                <li>Adjusted downloaded plot png width and height in order for all plots to fit properly onto the generated png</li>
              </ul>
              <li>Version 1.0.1: As a part of the review process for publishing the companion journal article at [currently not published] following changes have been made:</li>
              <ul>
                <li>Added a scroll-to-top button</li
                ><li>Added a version number in the right corner of the header banner</li>
                <li>Added a link to the Github page of the app source code in the right corner of the header banner (see Github icon)</li>
                <li>The tab which gives the mathematical details of the implemented effect sizes was named 'Effect Size Reference'</li>
                <li>All tabs have received icons</li>
                <li>Issues with links in the table of contents of the 'Effect Size Reference' tabs and other formatting issues of these tabs have been fixed</li> 
              </ul>
              <li>Version 1.0.0: Initial release.</li>
            </ul>
          "
        )
      )
    )
  )