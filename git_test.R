############################ Emma  Oschrin
############################ github test
mers <- read.csv('cases.csv')
head(mers)
class(mers$onset)

#correct errors
mers$hospitalized[890] <- c('2015-02-20')
mers <- mers[-471,]

library(lubridate)
mers$onset2 <- ymd(mers$onset)
mers$hospitalized2 <- ymd(mers$hospitalized)
class(mers$onset2)

day0 <- min(na.omit(mers$onset2))
mers$epi.day <- as.numeric(mers$onset2 - day0)

#making a plot in ggplot2
library(ggplot2)
ggplot(data=mers) +
  geom_bar(mapping = aes(x=epi.day)) +
  labs(x='Epidemic day', y='Case count', title = 'Global count of MERS cases by date of symptom onset',
       caption = "Data from: https://github.com/rambaut/MERS-Cases/blob/gh-pages/data/cases.csv")

