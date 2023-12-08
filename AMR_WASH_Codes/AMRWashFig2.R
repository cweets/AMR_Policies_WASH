

library(scales)
library(readxl)

excel_file1 <- "Complete_Data_AMR_WASH.xlsx"

####Medical Waste####
MedWasteFig2 <- read_excel(excel_file1, sheet = "MW_Calculations") 

#Make bar chart
MedFig <- (ggplot(MedWasteFig2, aes(x = perc, y =WHO_Region)) +
  geom_bar(stat = 'identity', fill = "#91bfdb", width =0.6) +
  ylab("") +
  xlab("") +
  ggtitle("Medical Waste Disposal") +
    theme_bw() +
    theme(
      plot.background = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.border = element_blank(), 
      axis.ticks.y = element_blank()))

#####Effluent####
EffluentFig2 <- read_excel(excel_file1, sheet = "Effluent_Calculations") 

#Make bar chart
EffFig <- (ggplot(EffluentFig2, aes(x = Percentage, y =WHO_Region)) +
             geom_bar(stat = 'identity', fill = "#91bfdb", width =0.6) +
             ylab("") +
             xlab("") +
             ggtitle("Wastewater Disposal") +
             theme_bw() +
             theme(
               plot.background = element_blank(),
               panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               panel.border = element_blank(),
               axis.ticks.y = element_blank()))

####Sewerage####
SewerFig2 <- read_excel(excel_file1, sheet = "Sewerage_Calculations") 

#Make bar chart
SewFig <- (ggplot(SewerFig2, aes(x = Percentage, y =WHO_Region)) +
             geom_bar(stat = 'identity', fill = "#91bfdb", width =0.6) +
             ylab("") +
             xlab("") +
             ggtitle("Sewerage") +
             theme_bw() +
             theme(
               plot.background = element_blank(),
               panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               panel.border = element_blank(),
               axis.ticks.y = element_blank()))

#####Water Monitoring#####


MonFig2 <- read_excel(excel_file1, sheet = "Monitoring_Calculations") 

#Make bar chart
MonFig <- (ggplot(MonFig2, aes(x = Percentage, y =WHO_Region)) +
             geom_bar(stat = 'identity', fill = "#91bfdb", width =0.6) +
             ylab("") +
             xlab("") +
             ggtitle("Water Monitoring") +
             theme_bw() +
             theme(
               plot.background = element_blank(),
               panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               panel.border = element_blank(),
               axis.ticks.y = element_blank()))

#####Water Quality####

QualFig2 <- read_excel(excel_file1, sheet = "Quality_Calculations") 

#Make bar chart
QualFig <- (ggplot(QualFig2, aes(x = Percentage, y =WHO_Region)) +
             geom_bar(stat = 'identity', fill = "#91bfdb", width =0.6) +
             ylab("") +
             xlab("") +
             ggtitle("Water Quality") +
              theme_bw() +
              theme(
                plot.background = element_blank(),
                panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                panel.border = element_blank(), 
                axis.ticks.y = element_blank()))

######Water Pollution####


PollutantFig2 <- read_excel(excel_file1, sheet = "Pollutant_Calculations") 

#Make bar chart
PollFig <- (ggplot(PollutantFig2, aes(x = Percentage, y =WHO_Region)) +
              geom_bar(stat = 'identity', fill = "#91bfdb", width =0.6) +
              ylab("") +
              xlab("") +
              ggtitle("Pollutant Disposal") +
              theme_bw() +
              theme(
                    plot.background = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    panel.border = element_blank(), 
                    axis.ticks.y = element_blank()))

#Open patchwork from library
library(patchwork)


#Put all of the Figures into the patchwork plot

Figure2 <- (
  QualFig + MonFig + PollFig + EffFig + SewFig + MedFig + plot_layout(nrow = 3, byrow = FALSE)
)


Fig2Wrap <- (wrap_elements(panel = Figure2) +
  labs(tag = "% of Countries") +
  theme(
    plot.tag = element_text(size = rel(1)),
    plot.tag.position = "bottom"))

print(Fig2Wrap)            

