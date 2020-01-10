
Years <- c(2013:2020)
Ended <- as.Date(c("01/16/2013","01/15/2014","01/14/2015","01/19/2016","01/17/2017","01/16/2018","01/14/2019","01/13/2020"), "%m/%d/%Y")
Started <- as.Date(c("12-17-2012","12-23-2013","12-23-2014","12-21-2015","12-19-2016","12-18-2017","12-17-2018","12-23-2019"), "%m-%d-%Y")
WinterBreakDays <- Ended - Started
WinterBreak <- as.data.frame(cbind(Years,Started,Ended))
WinterBreak$WinterBreakDays <- WinterBreak$Ended - WinterBreak$Started
library(ggplot2)
library(cowplot)

ggplot(WinterBreak) +
  aes(x = Years, y = WinterBreakDays) +
  geom_point() +
  theme_cowplot() +
  geom_smooth(method = "lm", fullrange = TRUE) +
  xlim(2010, 2030) +
  ylim(0,40)


ggplot(WinterBreak[5:8,]) +
  aes(x = Years, y = WinterBreakDays) +
  geom_point() +
  theme_cowplot() +
  geom_smooth(method = "loess", fullrange = TRUE) +
  xlim(2010, 2030) +
  ylim(0,40)

ggplot(WinterBreak[4:8,]) +
  aes(x = Years, y = WinterBreakDays) +
  geom_point() +
  theme_cowplot() +
  geom_smooth(method="lm", formula= (y~poly(x,2)), fullrange = TRUE, se = FALSE) +
  xlim(2017, 2025) +
  ylim(0,40)
