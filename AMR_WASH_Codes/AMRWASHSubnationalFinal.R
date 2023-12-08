library(readxl)
library(ggplot2)

# Create object with my excel file
excel_file <- "AMRWASHSubnational.xls"

# Read data from Excel file
data <- read_excel(excel_file, sheet = "LongSheet") 

# Define custom colors for the legend
custom_colors <- c("#8dd3c7", "#ffffb3", "#bebada" ,"#fb8072", "#fdb462", "#91bfdb")

# Define the desired order of GovSystem
desired_order <- c("Presidential Republic", "Parliamentary Republic", "Constitutional Monarchy", "Directorial", "Military Junta")

# Convert GovSystem to a factor with the desired order
data$GovSystem <- factor(data$GovSystem, levels = desired_order)


new_data <- data[-which(data$Value == 0),]

# Create a stacked, grouped bar chart
ggplot(new_data, aes(x = GovSystem, y = Value, fill = Category)) +
  geom_bar(stat = "identity", position = "stack", width = 0.95) +
  facet_wrap(~ GovType, scales = "free_x") +
  labs(
    x = "Form of Government",
    y = "Number of Subnational Policies",
    fill = "Policy Category") +
  theme_bw() + #Get rid of the ugly stuff
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Rotate x-axis labels
    strip.placement = "outside",
    strip.background = element_rect(fill = NA, color = "white"),
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.ticks.x = element_blank(),
    plot.margin = margin(1, 2, 1, 1, "cm")  # Adjust margins (top, right, bottom, left)
  ) +
  scale_fill_manual(values = custom_colors)
