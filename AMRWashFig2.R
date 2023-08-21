#Medical Waste####
### Made xls into a dataframe, upload to R

library(readxl)
MedWasteFig2 <- read_excel("MedWasteFig2.xls")

#Make stacked bar
MedFig <- (ggplot(MedWasteFig2, aes(x = perc, y =WHO_Region)) +
  geom_bar(stat = 'identity', fill = "#91bfdb", color = "black") +
  ylab("WHO Regions") +
  xlab("% of Countries") +
  ggtitle("Medical Waste Disposal") +
  theme_minimal())

#Effluent

library(readxl)
EffluentFig2 <- read_excel("AMREffluentDisposal.xls")

#Make stacked bar
EffFig <- (ggplot(EffluentFig2, aes(x = Percentage, y =WHO_Region)) +
             geom_bar(stat = 'identity', fill = "#91bfdb", color = "black") +
             ylab("WHO Regions") +
             xlab("% of Countries") +
             ggtitle("Wastewater Disposal") +
             theme_minimal())

#Sewerage
library(readxl)
SewerFig2 <- read_excel("SewerFig2.xls")

#Make stacked bar
SewFig <- (ggplot(SewerFig2, aes(x = Percentage, y =WHO_Region)) +
             geom_bar(stat = 'identity', fill = "#91bfdb", color = "black") +
             ylab("WHO Regions") +
             xlab("% of Countries") +
             ggtitle("Sewerage") +
             theme_minimal())

#Water Monitoring

library(readxl)
MonFig2 <- read_excel("WaterMonitorFig2.xls")

#Make stacked bar
MonFig <- (ggplot(MonFig2, aes(x = Percentage, y =WHO_Region)) +
             geom_bar(stat = 'identity', fill = "#91bfdb", color = "black") +
             ylab("WHO Regions") +
             xlab("% of Countries") +
             ggtitle("Water Monitoring") +
             theme_minimal())

#Water Quality

library(readxl)
QualFig2 <- read_excel("AMRFig2Qual.xls")

#Make stacked bar
QualFig <- (ggplot(QualFig2, aes(x = Percentage, y =WHO_Region)) +
             geom_bar(stat = 'identity', fill = "#91bfdb", color = "black") +
             ylab("WHO Regions") +
             xlab("% of Countries") +
             ggtitle("Water Quality") +
             theme_minimal())

#Water Pollution

library(readxl)
PollutantFig2 <- read_excel("WaterPollutionFig2.xls")

#Make stacked bar
PollFig <- (ggplot(PollutantFig2, aes(x = Percentage, y =WHO_Region)) +
              geom_bar(stat = 'identity', fill = "#91bfdb", color = "black") +
              ylab("WHO Regions") +
              xlab("% of Countries") +
              ggtitle("Pollutant Disposal in Water Sources") +
              theme_minimal())
#Open patchwork from library
library(patchwork)

#Put all of the Figures into the patchwork plot

Figure2 <- (
  QualFig + MonFig + PollFig + EffFig + SewFig + MedFig + plot_layout(nrow = 3, byrow = FALSE))

print(Figure2)            
