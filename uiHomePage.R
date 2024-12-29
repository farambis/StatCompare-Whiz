independentGroupsExampleData <- 
  "
<table class = home_page_table>
  <thead>
	  <tr>
		  <th scope = col>Id</th>
		  <th class = necessary_variable scope = col>Group</th>
		  <th class = necessary_variable scope = col>Outcome of interest</th>
		  <th scope = col>...</th>
	  </tr>
	</thead>
	<tbody>
  	<tr>
  	  <td>1</td>
  	  <td class = necessary_variable>a</td>
  	  <td class = necessary_variable>130</td>
  	  <td>...</td>
  	</tr>
  	<tr>
  	  <td>2</td>
  	  <td class = necessary_variable>b</td>
  	  <td class = necessary_variable>110</td>
  	  <td>...</td>
    </tr>
    <tr>
      <td>3</td>
      <td class = necessary_variable>b</td>
      <td class = necessary_variable>90</td>
      <td>...</td>
    </tr>
    <tr>
      <td>4</td>
      <td class = necessary_variable>a</td>
      <td class = necessary_variable>95</td>
      <td>...</td>
    </tr>
    <tr>
      <td>5</td>
      <td class = necessary_variable>a</td>
      <td class = necessary_variable>105</td>
      <td>...</td>
    </tr>
    <tr>
      <td>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
      <td>...</td>
  </tbody>
</table>
"


dependenGroupsExampleData <- 
  "
<table class = home_page_table>
  <thead>
	  <tr>
		  <th scope = col>Id</th>
		  <th class = necessary_variable scope = col>Measurement 1</th>
		  <th class = necessary_variable scope = col>Measurement 2</th>
		  <th scope = col>...</th>
	  </tr>
	</thead>
	<tbody>
  	<tr>
  	  <td>1</td>
  	  <td class = necessary_variable>110</td>
  	  <td class = necessary_variable>130</td>
  	  <td>...</td>
  	</tr>
  	<tr>
  	  <td>2</td>
  	  <td class = necessary_variable>140</td>
  	  <td class = necessary_variable>110</td>
  	  <td>...</td>
    </tr>
    <tr>
      <td>3</td>
      <td class = necessary_variable>95</td>
      <td class = necessary_variable>90</td>
      <td>...</td>
    </tr>
    <tr>
      <td>4</td>
      <td class = necessary_variable>120</td>
      <td class = necessary_variable>95</td>
      <td>...</td>
    </tr>
    <tr>
      <td>5</td>
      <td class = necessary_variable>108</td>
      <td class = necessary_variable>105</td>
      <td>...</td>
    </tr>
    <tr>
      <td>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
      <td>...</td>
  </tbody>
</table>
"

mixedDesignExampleData <- 
  "
<table class = home_page_table>
  <thead>
	  <tr>
		  <th scope = col>Id</th>
		  <th class = necessary_variable scope = col>Group</th>
		  <th class = necessary_variable scope = col>Measurement 1</th>
		  <th class = necessary_variable scope = col>Measurement 2</th>
		  <th scope = col>...</th>
	  </tr>
	</thead>
	<tbody>
  	<tr>
  	  <td>1</td>
  	  <td class = necessary_variable>a</td>
  	  <td class = necessary_variable>110</td>
  	  <td class = necessary_variable>130</td>
  	  <td>...</td>
  	</tr>
  	<tr>
  	  <td>2</td>
  	  <td class = necessary_variable>b</td>
  	  <td class = necessary_variable>140</td>
  	  <td class = necessary_variable>110</td>
  	  <td>...</td>
    </tr>
    <tr>
      <td>3</td>
      <td class = necessary_variable>b</td>
      <td class = necessary_variable>95</td>
      <td class = necessary_variable>90</td>
      <td>...</td>
    </tr>
    <tr>
      <td>4</td>
      <td class = necessary_variable>a</td>
      <td class = necessary_variable>120</td>
      <td class = necessary_variable>95</td>
      <td>...</td>
    </tr>
    <tr>
      <td>5</td>
      <td class = necessary_variable>a</td>
      <td class = necessary_variable>108</td>
      <td class = necessary_variable>105</td>
      <td>...</td>
    </tr>
    <tr>
      <td>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
      <td>...</td>
  </tbody>
</table>
"


multivariateExampleRawData <- 
  "
<table class = home_page_table>
  <thead>
	  <tr>
		  <th scope = col>Id</th>
		  <th class = necessary_variable scope = col>Group</th>
		  <th class = necessary_variable scope = col>Outcome 1</th>
		  <th class = necessary_variable scope = col>Outcome 2</th>
		  <th class = necessary_variable scope = col>...</th>
		  <th>...</th>
	  </tr>
	</thead>
	<tbody>
  	<tr>
  	  <td>1</td>
  	  <td class = necessary_variable>a</td>
  	  <td class = necessary_variable>130</td>
  	  <td class =necessary_variable>63</td>
  	  <td class = necessary_variable>...</td>
  	  <td>...</td>
  	</tr>
  	<tr>
  	  <td>2</td>
  	  <td class = necessary_variable>b</td>
  	  <td class = necessary_variable>110</td>
  	  <td class = necessary_variable>56</td>
  	  <td class = necessary_variable>...</td>
  	  <td>...</td>
    </tr>
    <tr>
      <td>3</td>
      <td class = necessary_variable>b</td>
      <td class = necessary_variable>90</td>
      <td class = necessary_variable>27</td>
      <td class = necessary_variable>...</td>
      <td>...</td>
    </tr>
    <tr>
      <td>4</td>
      <td class = necessary_variable>a</td>
      <td class = necessary_variable>95</td>
      <td class = necessary_variable>34</td>
      <td class = necessary_variable>...</td>
      <td>...</td>
    </tr>
    <tr>
      <td>5</td>
      <td class = necessary_variable>a</td>
      <td class = necessary_variable>105</td>
      <td class = necessary_variable>48</td>
      <td class = necessary_variable>...</td>
      <td>...</td>
    </tr>
    <tr>
      <td>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
      <td>...</td>
    </tr>
  </tbody>
</table>
"

multivariateExampleAggregateData1 <- 
  "
<table class =home_page_table>
  <caption>Means of outcome variables per group</caption>
  <thead>
	  <tr>
	    <th scope = col></th>
		  <th class = necessary_variable scope = col>Group a</th>
		  <th class = necessary_variable scope = col>Group b</th>
	  </tr>
	</thead>
	<tbody>
  	<tr>
  	  <th class = necessary_variable scope = row>Outcome 1</th>
  	  <td class = necessary_variable>110</td>
  	  <td class = necessary_variable>100</td>
  	</tr>
  	<tr>
  	  <th class = necessary_variable scope = row>Otucome 2</th>
  	  <td class = necessary_variable>48.3</td>
  	  <td class = necessary_variable>41.5</td>
    </tr>
    <tr>
      <th class = necessary_variable scope = row>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
    </tr>
  </tbody>
</table>
"

multivariateExampleAggregateData2 <- 
  "
<table class = home_page_table>
  <caption>Pooled covariance matrix of outcome variables</caption>
	  <tr>
	    <th  scope=col></th>
		  <th class = necessary_variable scope = col>Outcome 1</th>
		  <th class = necessary_variable scope = col>Outcome 2</th>
		  <th class = necessary_variable scope = col>...</th>
	  </tr>
  	<tr>
  	  <th class = necessary_variable scope = row>Outcome 1</th>
  	  <td class = necessary_variable>242.5</td>
  	  <td class = necessary_variable>269</td>
  	  <td class = necessary_variable>...</td>
  	</tr>
  	<tr>
  	  <th class = necessary_variable scope = row>Outcome 2</th>
  	  <td class = necessary_variable>269</td>
  	  <td class = necessary_variable>224.3</td>
  	  <td class = necessary_variable>...</td>
    </tr>
    <tr>
      <th class = necessary_variable scope = row>...</th>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
      <td class = necessary_variable>...</td>
    </tr>
</table>
"

homePageContent <- 
  fluidPage(
    includeCSS("www/home_page_style.css"),
    fluidRow(
      column(
        width=10,
        offset=1,
        html(
          "
              <article class = home_page_text>
                <h1 class = home_page_title>Shiny application for group-based comparisons of means and beyond</h1>
                <br>            
                  <div class = home_page_accordion>
                    <div class = accordion_container>
                      <div class = accordion_label>
                        <h2>About this app</h2>
                      </div>
                      <div class = accordion_content>
                        <p>This is the companion application to the paper <em><a href=https://www.psychologicalscience.org/publications/ampps></em>
                          One app to rule them all: A one-stop solution calculator and guide for 95 effect-size variants for two-group comparisons of central tendency, variability, overlap, dominance, and distributional tails</a></em>. Please cite the aforementioned paper when referring to this app.
                          The app was designed and programmed by Marton Gyimesi and Victor Webersberger. Its source code can be found on <a href=https://github.com/farambis/StatCompare-Whiz>Github</a> (you can always get to the Github page by clicking on the Github logo in the upper right corner).
                        </p>
                        <p>Over a third of quantitative research conducted in psychological science employ research designs in which two or more groups are compared (Blanca et al., 2018). Computing and interpreting effect sizes (ES) alongside their confidence intervals (CI)
                          is a frequently called for data analysis practice (APA, 2020; e.g., Cumming, 2014; Thompson, 2002;  Wilkinson & the Task Force on Statistical Inference). Thus, researchers ought to be equipped with knowledge about the ES they can use for analysing their 
                          data as well as with the necessary software to compute them and their CIs. 
                        </p>
                        <p>Amongst all ESs applicable for comparing two groups, Cohen's <em>d</em> has consistently been found to be the most frequently reported ES, if not the only one (e.g., Alhija & Levy, 2008; Fritz et al., 2012 a/b; Farmus et al., 2022). 
                          This prevalent use of Cohen's <em>d</em> is unsurprising for two reasons. Firstly, because Cohen's <em>d</em> is the ES primarily discussed in books on applied statistics (e.g., Cumming & Calin-Jageman, 2017; Field, 2017; Agresti, 2018). Secondly, since the formula for 
                          computing Cohen's <em>d</em> is supplied in the aforementioned literature and can be easily computed by hand from simple descriptive statistics provided by popular statistical software packages such as IBM SPSS Statistics. Thus, it seems that primarily 
                          those ESs are reported that gain prominence due to their inclusion in relevant literature and can be easily computed using widely knwon formulae requiring only basic summary statistics. 
                        </p>
                        <p>
                          The dominance of Cohen's <em>d</em> can be viewed as suboptimal since <b>1)</b> it has been ciritised for being biased (especially in small samples), susceptible to outliers, and for having an inflated sampling error when its statistical assumptions are violated (e.g., Algina, Keselman, & Penfield, 2005;
                          Hedges & Olkin, 1985); <b>2)</b> as well as for being too abstract to be readily understood by audiences not well versed in statistics (e.g., Hanel et al., 2018; McGraw & Wong, 1992). However, a plethora of ESs for comparing two groups have emerged 
                          over the years&mdash;see the reviews of Goulet-Pelletier and Cousineau, 2018, Keselman et al., 2008, and Peng and Chen, 2014 as well as the relevant chapters in Ellis, 2010 and Grissom & Kim, 2012. Some of these measures are unbiased and/or more robust versions
                          of Cohen's <em>d</em>, such as Hedges' <em>g</em> or <em>d</em><sub>R</sub>, while others estimate completely different quantities said to be more readily understendable, such as the common language effect size (<em>CL</em>) or the measure of overlap between two groups (<em>OVL</em>). Yet most of these ESs are not discussed in applied statistics textbooks and only a handful have 
                          been implemented in statistical software widely used by psychologists. Blanca et al. (2018) found that the most commonly used statistical software for conducting parametric tests for group comparisons was IBM SPSS Statistics. For comparing two groups 
                          this software package, as of writing (version 29), only offers Glass’ <em>d</em> and Hedges’ <em>g</em> besides Cohen’s <em>d</em>. Hence, this shiny app not only aims to inform about the multitude of ESs that are suitable for comparing two groups but also allows users to compute these ESs
                          and their CIs for raw and aggregate data.
                        </p>
                        <p>
                          The implemented ESs (for a detailed list download the following <a href=https://github.com/farambis/StatCompare-Whiz/blob/master/StatCompare_Whiz_ES_full_list.docx>.docx table</a>) are organised according to the research designs they are applicable to. This organisation is reflected in the sidebar menu items of this app&mdash;<em>independent groups</em>, <em>dependent groups</em>, <em>mixed design</em>, and <em>multivariate</em>. A further distinction is made between parametric ESs, i.e., those with assumptions regarding the shapes of the contrasted populations, and non-parametric ES, i.e., those without such assumptions. This is reflected in respective menu sub-items&mdash;<em>parametric</em> and <em>non-parametric</em>. Lastly, for parametric ESs the user can either select whether they want to compute ESs for raw data (see accepted file formats below) or for aggregate data (see exceptions below). As a consequence for each parametric menu sub-item there are an additional two sub-items&mdash;<em>raw data</em> and <em>aggregate data</em>
                        </p>
                        <p>
                          The layout of each page consists of a sidebar and a main panel. In the sidebar, users can specify the input data, either by uploading raw data and selecting variables or by specifying values of summary statistics for ES calculations.
                          The main panel consists of the <em>Data</em>, <em>Effect Sizes & Test Statistics</em>, <em>Plots</em>, and <em>Effect Size Reference</em> tabs. The <em>Data</em> tab shows the uploaded data in a table as well as summary statistics of the selected variables which are relevant to the selected design.
                          The <em>Effect Sizes & Test Statistics</em> tab displays the user-selected ESs and their CIs in a table that can be downloaded as a .csv file as well as user-selected test statistics (TS) for certain research designs. The <em>Plots</em> tab allows the user to create plots of selected ESs, which can be downloaded as PDF files. The <em>Effect Size Reference</em> panel contains background information on the ESs offered including the formulae on which the calculations are based.
                          User inputs are reactively validated and informative error messages are displayed if the user has uploaded invalid data or selected invalid input values.
                          Sometimes notifications are displayed in the bottom right to inform users about:
                          <ul>
                            <li>the removal of rows with missing data---relevant for ES computation,</li>
                            <li>the recalculation of bootstrap CIs after changes to inputs are made,</li>
                            <li>the failure of an iterative search algorithm causing the computation of an approximation instead of an exact value (see the documentations of the variance ratio and the tail ratio)</li>
                          </ul>
                        </p>
                        <p>
                          Different ES interpretation guidelines provide different criteria for 
                          what might consitute, for example, a small, medium, or large effect. Hence, 
                          no interpretation guidelines are implemented in this app. Instead, we 
                          encourage users to choose for themselves the guideline that appears the 
                          most fitting for their specific aims and purposes. Moreover, with this app,
                          we also want to provide users with the possibility to not use any guideline
                          at all and instead come to their own conclusion what constitutes a small, 
                          medium or large effect size given the context of the concrete research 
                          question at hand (<a href=https://doi.org/10.1177/2515245919847202>Funder & Ozer, 2019</a>)
                        </p>
                      </div>
                    </div>
                    <hr>
                    <div class = accordion_container>
                      <div class = accordion_label>
                        <h2>File uploads</h2>
                      </div>
                      <div class = accordion_content>
                        <p>Any analysis of raw data as well as  the multivariate analysis of aggregate data requires the user to upload files containing
                          the raw or aggregate data. Any uploaded file should meet the following general criteria:
                          <ul>
                            <li>(For now at least) it should be a <b>.csv</b> file, meaning that columns should be separated by commas and a decimal point should be denoted by a period.
                            Further file types might be added in future versions of the app.</li>
                            <li>The first row of the file should contain the variable names (with exception of the aggregate data files for multivariate analysis).</li>
                            <li>Missing cell values should be denoted by <code>NA</code>.</li>
                          </ul>
                          The file may contain variables which are not meant for analysis with this app&mdash;meaning that \"non-relevant\" columns/variables don't have 
                          to be deleted prior to using this app. 
                          <br>
                          Further design specific requirements for the uploaded data file can be found in the tabs below.
                        </p>
                      </div>
                    </div>
                    <hr>
                    <div class = accordion_container>
                      <div class = accordion_label>
                        <h2>Design-specific data requirements & example data sets</h2>
                      </div>
                      <div class = accordion_content>
              "
        ),
        tabsetPanel(
          tabPanel(
            html("<sapn class = home_page_tab_header>independent groups</span>"),
            html(
              paste(
                "<div class = home_page_text>
                      <h3>Data requirements</h3>
                        <p>For both parametric and non-parametric analysis of <em>raw data</em>, the uploaded <em>.csv</em> file has to contain the following two
                        variables/columns:
                          <ul>
                            <li>A variable indicating group membership. This variable should either contain numbers 
                                (like 1 and 2) or characters (like a and b). It is <b>necessary</b> for this variable to contain only two distinct values
                                (aside from potential <code>NA</code> values) since analysis is solely offered for comparing <b>two</b> independent groups. If
                                a variable with more than two distinct values is selected as the <em>group</em> variable an error message is triggered
                                and computations are halted.</li>
                            <li>An outcome/dependent variable measured at least on an interval scale. When selecting the outcome variable
                                the app offers a choice of numeric variables only.</li>
                          </ul>
                          The uploaded data file can contain any number of variables and the user may switch between different group and outcome variables as 
                          long as the variables fulfil the above criteria. See the table below
                          for an example data set.
                        </p>
                        <p>For the parametric analysis of <em>aggregate data</em> means, standard deviations and sample sizes can be provided by numeric inputs.
                          Hence no data file has to be uploaded.
                        </p>",
                independentGroupsExampleData,
                "</div>"
              )
            )
          ),
          tabPanel(
            html("<span class  =home_page_tab_header>dependent groups</span>"),
            html(
              paste(
                "<div class = home_page_text>
                      <h3>Data requirements</h3>
                        <p>For both parametric and non-parametric analysis of <em>raw data</em>, the uploaded <em>.csv</em> file has to contain the following
                          two variables/columns:
                          <ul>
                            <li>Measurement 1 of the outcome/dependent variable of interest (measured at least on an interval scale).
                              This may for example be a pretest-measurement, the measurement after the first of two interventions,
                              the measurement of one of the persons in a matched-pair design. When selecting <em>measurement 1</em> this app
                              offers a choice of numeric variables only.</li>
                            <li>Measurement 2 of the outcome/dependent variable of interst (measured at least on an interval scale).
                              Following the examples from before, this may be a posttest-measurement, the measurement after
                              the second of two interventions, or the measurement of the second person in a matched-pair design.
                              When selecting measurement 2 this app offers a choice of numeric variables only.</li>
                          </ul>
                          The uploaded data file can contain any number of variables and the user may switch between different 
                          pairs of dependent measurements. See the table below for an example data set.
                        </p>
                        <p>For the parametric analysis of <em>aggregate data</em> means, standard deviations, the sample size and the 
                          correlation between measurements can be provided by numeric inputs. Hence no data file has to be uploaded.
                        </p>",
                dependenGroupsExampleData,
                "</div>"
              )
            )),
          tabPanel(
            html("<span class = home_page_tab_header>mixed design</span>"),
            html(
              paste(
                "<div class = home_page_text>
                      <h3>Data requirements</h3>
                        <p>For both parametric and non-parametric analysis of <em>raw data</em>, the uploaded <em>.csv</em> file has to contain the following
                          three variables/columns:
                          <ul>
                            <li>A variable indicating group membership. This variable should either contain numbers 
                                (like 1 and 2) or characters (like a and b). It is <b>necessary</b> for this variable to contain only two distinct values
                                (aside from potential <code>NA</code> values) since analysis is solely offered for comparing <b>two</b> independent groups. If
                                a variable with more than two distinct values is selected as the <em>group</em> variable an error message is triggered
                                and computations are halted.</li>
                            <li>Measurement 1 of the outcome/dependent variable of interest (measured at least on an interval scale).
                              This may for example be a pretest-measurement, the measurement after the first of two interventions,
                              the measurement of one of the persons in a matched pair. When selecting <em>measurement 1</em> this app
                              offers a choice of numeric variables only.</li>
                            <li>Measurement 2 of the outcome/dependent variable of interst (measured at least on an interval scale).
                              Following the examples from before, this may be a posttest-measurement, the measurement after
                              the second of two interventions, or the measurement of the second person in a matched pair.
                              When selecting measurement 2 this app offers a choice of numeric variables only.</li>
                          </ul>
                          The uploaded data file can contain any number of variables and the user may switch between different 
                          group variables and dependent measurements. See the table below for an example data set.
                        </p>
                        <p>For the parametric analysis of <em>aggregate data</em> means, standard deviations,
                          sample sizes and correlations can be provided by numeric inputs. Hence no data file has to be uploaded.
                        </p>
                        </p>",
                mixedDesignExampleData,
                "</div>"
              )
            )),
          tabPanel(
            html("<span class = home_page_tab_header>multivariate analysis</span>"),
            tabsetPanel(
              tabPanel(
                html("<span class = home_page_tab_header>raw data</span>"),
                html(
                  paste(
                    "<div class = home_page_text>
                      <h3>Data requirements</h3>
                        <p>For both parametric and non-parametric analysis of <em>raw data</em>, the uploaded <em>.csv</em> file has to contain the following
                          variables/columns:
                          <ul>
                            <li>A variable indicating group membership. This variable should either contain numbers 
                                (like 1 and 2) or characters (like a and b). It is <b>necessary</b> for this variable to contain only two distinct values
                                (aside from potential <code>NA</code> values) since analysis is solely offered for comparing <b>two</b> independent groups. If
                                a variable with more than two distinct values is selected as the <em>group</em> variable an error message is triggered
                                and computations are halted.</li>
                            <li>Two or more outcome/dependent variables measured at least on an interval scale. When selecting these variables
                                the app offers a choice of numeric variables only. The user may select multiple variables from the drop-down menu.</li>
                          </ul>
                          The uploaded data file can contain any number of variables and the user may switch between different 
                          group variables and sets of outcome/dependent variables. See the table below for an example data set.
                        </p>",
                    multivariateExampleRawData,
                    "</div>"
                  )
                )
              ),
              tabPanel(
                html("<span class = home_page_tab_header>aggregate data</span>"),
                html(
                  paste(
                    "<div class = home_page_text>
                          <h3>Data requirements</h3>
                            <p>For the <em>aggregate data mode</em> two separate data files have to be uploaded:
                            <ol>
                              <li>Firstly, a <em>.csv</em> file of means of outcome/dependent variables for each group:
                                <ul>
                                  <li>the first column should contain the means of the outcome/dependent variables within the first group</li>
                                  <li>the second column should contain the means of the outcome/dependent variables within the second group</li>
                                </ul>
                               In case the file has more or less than two columns an error message is triggered and computations are halted.
                              </li>
                              <li>Secondly, a <em>.csv</em> file containing the pooled variance-covariance matrix of all outcome/dependent variables 
                               of interest. This file should have the same number of rows and columns. The number of rows of this data file should 
                               equal the number of rows of the first one. In case these conditions are not met, appropriate error messages are
                               triggered and computations are halted.</li>
                            </ol>
                            <p>See the tables below for example data files. It should be noted that the uploaded files should not contain any row or column headers as 
                             presented below. They should only contain the required numeric values. Here the headers are only included to highlight
                             what values are required where in the data file.
                            </p>
                            </p>",
                    "<div class = row_of_tables>
                          <div class = column_of_table>", multivariateExampleAggregateData1, "</div>",
                    "<div class = column_of_table>", multivariateExampleAggregateData2, "</div>
                         </div>",
                    "</div>"
                  )
                )
              )
            )
          )
        ),
        html(
          "     </div>
                <hr>
                </div> 
              </div>
            </aricle>
              "
        )
      )
    ),
    includeScript(path="js/home_page_script.js", type = "text/javascript")
  )