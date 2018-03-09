##########################
# Created by: rucoma     #
# Date:       2017-02-03 #
##########################

library(shiny)
runExample(example = "01_hello")

runApp('./appCurso')

## Plotly charts side by side in RMarkdown ------
<div>
 <div style = "display:inline-block">
 ```{r echo = F, fig.width = 4, fig.height = 4}
 p
 ```
 </div>

 <div style = "display:inline-block">
 ```{r, echo = F, fig.width = 4, fig.height = 4}
 p
 ```
</div>
