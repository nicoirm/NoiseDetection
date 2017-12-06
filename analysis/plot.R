# Plotting generated data in R
require(ggplot2)

collection <- read.table("../prototypes/1.0/NoiseDetection_graph/output.csv", sep=",")
p <- qplot(1:nrow(collection),collection[,1], geom="line", main="Crossroad noise pollution", ylab="Volume", xlab="Time")
p + theme(axis.text.x = element_blank(), axis.text.y = element_blank(), axis.ticks = element_blank())
