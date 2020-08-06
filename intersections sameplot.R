# Library
library(tidyverse)
library(ggplot2)


# read the data 
left <- data.frame(read_csv("left.csv"))
diverse <- data.frame(read_csv("diverse.csv"))
right <- data.frame(read_csv("right.csv"))
total <- data.frame(read_csv("total.csv"))

# combine & shape the data 
left$Section="Left"
diverse$Section="Diverse"
right$Section="Right"
total$Section="Total"

allsections <- rbind(left,diverse,right,total)
allsections$Section <- factor(allsections$Section, levels = c("Right","Diverse","Left","Total"))




# charts combined

right_levels <- rev(right[,1])
ggplot(allsections) + aes(x=Component, y=Su17) + scale_x_discrete(limits=right_levels) + 
  geom_linerange( aes(x=Component, ymin=Sp16, ymax=Su17, color = Section),  position = position_dodge(width = 0.5) ) + 
  geom_point( aes(x=Component, y=Su17, color = Section), position = position_dodge(width = 0.5)) +
  coord_flip()+
  theme_light()  + 
  ylim(c(0,1)) +
  theme(
    axis.title.x = element_text(vjust=-1, size=9) ,
    panel.border = element_blank(), 
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.ticks.y  = element_blank(),
    panel.grid.minor.x = element_blank()
  ) +
  xlab("") +
  ylab("Comment hit rate") + 
  scale_color_manual(values=c("#990000","#999999","#000099","#333333")) +
  guides(color = guide_legend(reverse=TRUE)) 

ggsave("allsections.png", dpi=300, height=3, width=5, units="in")