#Make Monitoring Map#

library(readxl)

# Create object with my excel file
excel_file1 <- "Complete_Data_AMR_WASH.xlsx"

# Read data from Excel file
AMR_Water_Monitor <- read_excel(excel_file1, sheet = "Monitoring_Regional") 


world <- map_data("world")
Mon_world_data <- inner_join(world, AMR_Water_Monitor, by = join_by(region == Country))

MonMap <- (ggplot(data = Mon_world_data, mapping = aes(x = long, y = lat, group = group)) + 
             coord_fixed(1.3) +
             geom_polygon(aes(fill = Status)) +
             ggtitle("Water Monitoring") +
             scale_fill_manual(values = c("#EF8A62", "#91bfdb", "#ffffbf")) +
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

AMR_Water_Quality <- read_excel(excel_file1, sheet = "Quality_Regional") 

Qual_world_data <- inner_join(world, AMR_Water_Quality, by = join_by(region == Country))

QualMap <- (
  ggplot(data = Qual_world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Water Quality") +
  scale_fill_manual(values = c("#EF8A62", "#91bfdb", "#ffffbf")) +
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


AMR_Water_Pollutant <- read_excel(excel_file1, sheet = "Pollutant_Regional")

Poll_world_data <- inner_join(world, AMR_Water_Pollutant, by = join_by(region == Country))

PollMap <- (
  ggplot(data = Poll_world_data, mapping = aes(x = long, y = lat, group = group)) + 
              coord_fixed(1.3) +
              geom_polygon(aes(fill = Status)) +
              ggtitle("Pollutant Disposal") +
              scale_fill_manual(values =  c("#EF8A62", "#91bfdb", "#ffffbf")) +
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

AMR_Water_Effluent <- read_excel(excel_file1, sheet = "Effluent_Regional") 

Eff_world_data <- inner_join(world, AMR_Water_Effluent, by = join_by(region == Country))

EffMap <- (
  ggplot(data = Eff_world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Wastewater Disposal") +
  scale_fill_manual(values =  c("#EF8A62", "#91bfdb", "#ffffbf")) +
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

AMR_Sewer <- read_excel(excel_file1, sheet = "Sewerage_Regional") 

Sew_world_data <- inner_join(world, AMR_Sewer, by = join_by(region == Country))

SewMap <- (
  ggplot(data = Sew_world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Sewerage") +
    scale_fill_manual(values =  c("#EF8A62", "#91bfdb", "#ffffbf"), labels = c("Policy Absent", "Policy Present", "Label3")) +
    labs(fill = "Policy Status") +
  theme(
    #legend.position = "none",
    axis.text = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    panel.background = element_rect(fill= "white"),
    plot.title = element_text(hjust = 0.5)))

#Make Medical Waste Map

AMR_Med_Waste <- read_excel(excel_file1, sheet = "MedicalWaste_Regional") 

Med_world_data <- inner_join(world, AMR_Med_Waste, by = join_by(region == Country))

MedMap <- (
  ggplot(data = Med_world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Medical Waste Disposal") +
  scale_fill_manual(values =  c("#EF8A62", "#91bfdb", "#ffffbf")) +
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

