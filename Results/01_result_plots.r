####################################################################################################
###
### File:    01_result_plot.R
### Purpose: Code create for visualising the results from
###          the Deep Generative models.
### Authors: Gabriel Palma
### Date:    14/06/2022
###
####################################################################################################
# Loading the required packages and functions -----
source('00_source.r')

# Loading the datasets -----
acc <- read.csv('5GdatasetAutoencoderAccuracy.csv')[,2]
loss <- read.csv('5GdatasetAutoencoderLoss.csv')[,2]

# Creating appropriate dataset based on the values encountered -----
data <- data.frame(accuracy = acc,
                   loss = loss, 
                   epochs = seq(1, length(loss)))
data <- data %>% pivot_longer(cols = 1:2)
colnames(data) <- c('Epochs', 'Metrics', "Values")
View(data)

# Creating the plots with ggplot2 -----
p <- ggplot(data, aes(Epochs, Values, colour = Metrics))
p <- p + geom_line() + facet_wrap(~Metrics, nrow = 2, 
                                     scales = "free_y")
p  + labs(title = "",y = "", x = "Epochs") + theme_new() 

ggsave(here("Plots/Results.png"), dpi=400, width = 10, height = 6)
