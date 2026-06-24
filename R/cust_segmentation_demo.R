# Load required libraries
# install.packages("ggplot2")  # If not already installed
# install.packages("dplyr")    # If not already installed

library(ggplot2)
library(dplyr)

# ---- STEP 1: Generate Synthetic Nike Customer Data ----

set.seed(123)  # Ensure reproducibility

# Create 1000 customers with random Age and Annual Spend
# Generate distinct customer groups
nike_customers <- data.frame(
    Customer_ID = 1:1000,
    Age = c(
        sample(18:25, 300, replace = TRUE),  # Young athletes
        sample(26:40, 400, replace = TRUE),  # Casual buyers
        sample(41:60, 300, replace = TRUE)   # High-income premium customers
    ),
    Annual_Spend = c(
        rnorm(300, mean = 300, sd = 50),   # Budget buyers ($300 avg spend)
        rnorm(400, mean = 600, sd = 100),  # Mid-tier ($600 avg spend)
        rnorm(300, mean = 1000, sd = 150)  # High spenders ($1000 avg spend)
    )
)

head(nike_customers)

# Visualization
# How would you separate Nike customers into groups?
ggplot(nike_customers, aes(x = Age, y = Annual_Spend)) +
    geom_point(alpha = 0.6, size = 3) 

# Ensure spend is positive
nike_customers$Annual_Spend <- pmax(nike_customers$Annual_Spend, 50)

# ---- STEP 2: Allow Students to Set the Number of Clusters ----

# Define number of clusters (Students can change this!)
k <- 3  # Try changing to 2, 4, or 5

# ---- STEP 3: Apply K-Means Clustering ----

kmeans_result <- kmeans(nike_customers[, c("Age", "Annual_Spend")], centers = k, nstart = 25)
nike_customers$Cluster <- as.factor(kmeans_result$cluster)  # Assign clusters

# ---- STEP 4: Visualize the Segmentation ----

ggplot(nike_customers, aes(x = Age, y = Annual_Spend, color = Cluster)) +
    geom_point(alpha = 0.6, size = 3) +
    labs(
        title = paste("Nike Customer Segmentation (k =", k, ")"),
        x = "Age",
        y = "Annual Spending ($)",
        color = "Customer Segment"
    ) +
    theme_minimal() +
    theme(legend.position = "right") +
    scale_color_manual(values = c("red", "blue", "green", "purple", "orange"))  # Up to 5 clusters
