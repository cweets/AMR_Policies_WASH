#Make Monitoring Map#

library(readxl)
AMR_Water_Monitor <- read_excel("AMR Water Monitoring.xls")

world <- map_data("world")
world_data <- inner_join(world, AMR_Water_Monitor, by = join_by(region == Country))

MonMap <- (ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
             coord_fixed(1.3) +
             geom_polygon(aes(fill = Status)) +
             ggtitle("Water Monitoring Regulations") +
             scale_fill_manual(values = c("#EF8A62", "#ffffbf", "#91bfdb")) +
             labs(fill = "Status") +
             theme(
               legend.position = "none",
               axis.text = element_blank(),
               axis.line = element_blank(),
               axis.ticks = element_blank(),
               panel.border = element_blank(),
               panel.grid = element_blank(),
               axis.title = element_blank(),
               panel.background = element_rect(fill= "white"),
               plot.title = element_text(hjust = 0.5)))

#Make Quality Map#

library(readxl)
AMR_Water_Quality <- read_excel("AMR Water Quality.xls")

world <- map_data("world")
world_data <- inner_join(world, AMR_Water_Quality, by = join_by(region == Country))

QualMap <- (
  ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Water Quality Regulations") +
  scale_fill_manual(values = c("#EF8A62", "#ffffbf", "#91bfdb")) +
  labs(fill = "Status") +
  theme(
    legend.position = "none",
    axis.text = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    panel.background = element_rect(fill= "white"),
    plot.title = element_text(hjust = 0.5)))

#Make Pollution Map

library(readxl)
AMR_Water_Pollutant <- read_excel("AMRPollutantDisposal.xls")

world <- map_data("world")
world_data <- inner_join(world, AMR_Water_Pollutant, by = join_by(region == Country))

PollMap <- (
  ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
              coord_fixed(1.3) +
              geom_polygon(aes(fill = Status)) +
              ggtitle("Water Pollutant Disposal Regulations") +
              scale_fill_manual(values =  c("#EF8A62", "#ffffbf", "#91bfdb")) +
              labs(fill = "Status") +
              theme(
                legend.position = "none",
                axis.text = element_blank(),
                axis.line = element_blank(),
                axis.ticks = element_blank(),
                panel.border = element_blank(),
                panel.grid = element_blank(),
                axis.title = element_blank(),
                panel.background = element_rect(fill= "white"),
                plot.title = element_text(hjust = 0.5)))

#Make Effluent Map

library(readxl)
AMR_Water_Effluent <- read_excel("AMREffluentDisposal.xls")

world <- map_data("world")
world_data <- inner_join(world, AMR_Water_Effluent, by = join_by(region == Country))

EffMap <- (
  ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Wastewater Disposal Regulations") +
  scale_fill_manual(values =  c("#EF8A62", "#ffffbf", "#91bfdb")) +
  labs(fill = "Status") +
  theme(
    legend.position = "none",
    axis.text = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    panel.background = element_rect(fill= "white"),
    plot.title = element_text(hjust = 0.5)))

#Make Sewer Map

library(readxl)
AMR_Sewer <- read_excel("AMRSewer.xls")

world <- map_data("world")
world_data <- inner_join(world, AMR_Sewer, by = join_by(region == Country))

SewMap <- (
  ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Sewerage Regulations") +
  scale_fill_manual(values =  c("#EF8A62", "#ffffbf", "#91bfdb")) +
  labs(fill = "Status") +
  theme(
    legend.position = "none",
    axis.text = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    panel.background = element_rect(fill= "white"),
    plot.title = element_text(hjust = 0.5)))

#Make Medical Waste Map

library(readxl)
AMR_Med_Waste <- read_excel("AMRMedWaste.xls")

world <- map_data("world")
world_data <- inner_join(world, AMR_Med_Waste, by = join_by(region == Country))

MedMap <- (
  ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Medical Waste Disposal Regulations") +
  scale_fill_manual(values =  c("#EF8A62", "#ffffbf", "#91bfdb")) +
  labs(fill = "Status") +
  theme(
    legend.position = "none",
    axis.text = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    panel.background = element_rect(fill= "white"),
    plot.title = element_text(hjust = 0.5)))

#Open patchwork from library
library(patchwork)

#Put all of the Maps into the patchwork plot

MapsFigure <- (
  QualMap + MonMap + PollMap + EffMap + SewMap + MedMap + plot_layout(nrow = 3, byrow = FALSE))

print(MapsFigure)

