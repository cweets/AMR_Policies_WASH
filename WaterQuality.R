#Map of National Level Water Quality Legislation by Country from AMP for EID#

library(readxl)
AMR_Water_Quality <- read_excel("AMR Water Quality.xls")

world <- map_data("world")
world_data <- inner_join(world, AMR_Water_Quality, by = join_by(region == Country))

ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = Status)) +
  ggtitle("Water Quality Legislation") +
  scale_fill_manual(values = wes_palette("Moonrise3")) +
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
    plot.title = element_text(hjust = 0.5))

  