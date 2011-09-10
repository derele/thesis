library(ggplot2)
library(reshape)  

sc <- read.delim("sequencing_cost.csv", sep=",")
names(sc) <- c("Date", "Cost.Mb", "Cost per human genome in $")

sc$Date <- factor(sc$Date, levels=sc$Date, ordered=TRUE)
sc$number <- 1:nrow(sc)


sc[, 2] <- as.numeric(gsub("\\$|,| ", "", sc[, 2]))
sc[, 3] <- as.numeric(gsub("\\$|,| ", "", sc[, 3]))



seq.co <- ggplot(sc,
                 aes(number, Cost.Mb)) +
  geom_point(size=5) +
  geom_line(size=3) +
  scale_y_log10("Cost per megabase of DNA sequence") +
  scale_x_continuous("Time", breaks=sc$number, labels=sc$Date) +
  theme_bw() +
 ##  stat_smooth(method="lm", se=FALSE) +
  opts(axis.text.x=theme_text(angle=-55)) 

ggsave("../figures/sequencing_costs.png", seq.co)
 
       


