# ======================================
# Maize Price vs Market Arrivals Analysis
# ======================================

# Load required libraries
library(ggplot2)

# --------------------------------------
# Step 1 — Load Dataset
# --------------------------------------

setwd("G:/Projects/regression")

data <- read.csv("maize_price_arrivals.csv")

# Inspect dataset
str(data)
head(data)

# --------------------------------------
# Step 2 — Summary Statistics
# --------------------------------------

summary(data)

# --------------------------------------
# Step 3 — Correlation Analysis
# --------------------------------------

correlation <- cor(data$price, data$arrivals)

print(paste("Correlation between arrivals and price:", correlation))

# --------------------------------------
# Step 4 — Linear Regression Model
# --------------------------------------

model <- lm(price ~ arrivals, data = data)

summary(model)

# --------------------------------------
# Step 5 — Scatter Plot with Regression Line
# --------------------------------------

plot1 <- ggplot(data, aes(x = arrivals, y = price)) +
  geom_point(size = 2, alpha = 0.7) +
  geom_smooth(method = "lm", color = "blue") +
  labs(
    title = "Relationship Between Market Arrivals and Price",
    x = "Market Arrivals",
    y = "Price (Rs/quintal)"
  ) +
  theme_minimal(base_size = 14)

print(plot1)

# Save plot
ggsave(
  "price_arrivals_relationship.svg",
  plot = plot1,
  width = 12,
  height = 5.5
)

# --------------------------------------
# Step 6 — Residual Diagnostics
# --------------------------------------

par(mfrow=c(2,2))
plot(model)

# Save diagnostics
svg("regression_diagnostics.svg", width = 12, height = 5.5)
par(mfrow=c(2,2))
plot(model)
dev.off()

# --------------------------------------
# Step 7 — Key Results
# --------------------------------------

coef(model)

# ======================================
# End of Script
# ======================================
