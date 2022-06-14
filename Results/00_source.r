####################################################################################################
###
### File:    00_source.R
### Purpose: Load required packages and functions used throughout Sound to image: Bird identification based on CNN paper
### Authors: Gabriel Palma
### Date:    14/06/2022
###
####################################################################################################

### packages required

packages <- c('tidyverse', # data-wrangling + plotting
              'here' # efficient file structures
)
install.packages(setdiff(packages, rownames(installed.packages())))
lapply(packages, library, character.only = TRUE)

### plot settings
theme_new <- function(base_size = 14, base_family = "Arial"){
  theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      axis.text = element_text(size = 12, colour = "grey30"),
      legend.key = element_rect(colour=NA, fill =NA),
      axis.line = element_line(colour = 'black'),
      axis.ticks = element_line(colour = "grey20"),
      plot.title.position = 'plot',
      legend.position = "bottom", 
      panel.grid.minor.y = element_blank(),
      panel.grid.minor.x = element_blank()
    )
}
