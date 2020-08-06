# Library
library(tidyverse)
library(ggplot2)

# read & shape the data 
allsecES <- data.frame(read_csv("allsecES.csv"))

allsecES$Section <- factor(allsecES$Section, levels = c("Right","Diverse","Left","Total"))
allsecES$BoundaryType <- factor(allsecES$BoundaryType, levels = c("Populist: Elite- & Common+","Common-", "Elite+","Common+","Elite-"))


allsecES_levels <- rev(right[,1])

ggplot(allsecES) + aes(x=BoundaryType, y=Su17) +  
  geom_linerange( aes(x=BoundaryType, ymin=Sp16, ymax=Su17, color = Section),  position = position_dodge(width = 0.5) ) + 
  geom_point( aes(x=BoundaryType, y=Su17, color = Section), position = position_dodge(width = 0.5)) +
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

ggsave("allsecES.png", dpi=300, height=2.5, width=5, units="in")