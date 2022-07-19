####################################################################################################
###
### File:    01_result_plot.R
### Purpose: Code create for obtaining statistics of the results from
###          the Deep Generative models.
### Authors: Gabriel Palma
### Date:    14/07/2022
###
####################################################################################################
# Loading the required packages and functions -----
source('00_source.r')

# Loading the datasets -----
original_data <- read.csv('output_data/original_data.csv')[,-1]
decoded_data <- read.csv('output_data/decoded_data.csv')[,-1]

original_data$type <- rep('Original data', nrow(original_data))
decoded_data$type <- rep('Decoded data', nrow(decoded_data))

data <- rbind(original_data, decoded_data)
# Obtaining statistics -----
data %>% group_by(type) %>% 
  summarise(mean = mean(UL_bitrate))

data %>% group_by(type) %>% 
  summarise(mean_ulbitrate = mean(UL_bitrate), 
            mean_cellid = mean(CellID),
            mean_RSRQ = mean(RSRQ))
