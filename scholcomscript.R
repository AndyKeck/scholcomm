#load graphing library
library(ggplot2)

#plot Higher Education
ggplot(schooldata, aes(x = FY)) +
  geom_point(aes(y=HighEdBillions)) +
  scale_y_continuous(breaks=c(50, 75, 100, 125, 150, 175, 200), 
                     labels = c("$50", "$75", "$100", "$125", "$150", "$175", "$200")) +
  labs(title = "US Higher Education Spending in Billions", 
       caption = "Source: US Department of Commerce. Bureau of Economic Analysis. Table 2.5.5.",
       x = "Year",
       y = "In billions")

#plot average periodical costs
ggplot(pubdata, aes(x = Year)) +
  geom_path(aes(y=Per_RP_Price, color = "Rel & Phil Periodicals")) +
  geom_path(aes(y=CPI_Acad_RP, color = "CPI")) +
  labs(title = "Religion and Philosophy Periodicals Costs", 
       subtitle = "Growth in Price 1998 - 2016", 
       caption = "Sources: Bowker annual of library and 
book trade information (1998-2008)
       Library and Book Trade Almanac (2009-)",
       x = "Year",
       y = "Average Annual Cost per Title")

#plot cost per title published
ggplot(pubdata, aes(x = Year)) +
#  geom_path(aes(y=Hard_Rel_Price, color = "Rel Hardback")) +
#  geom_path(aes(y=Paper_Rel_Price, color = "Rel Paperback")) +
  geom_path(aes(y=Acad_RP_Price, color = "Rel & Phil Academic")) +
  geom_path(aes(y=CPI_Acad_RP, color = "CPI")) +
  labs(title = "Academic Books in Religion and Philosophy", 
       subtitle = "Growth in Price 1998 - 2015", 
       caption = "Sources: Bowker annual of library and 
book trade information (1998-2008)
       Library and Book Trade Almanac (2009-)",
       x = "Year",
       y = "Average Price per Book")

#plot volume of titles published
ggplot(pubdata, aes(x = Year)) +
#  geom_path(aes(y=Hard_Rel, color = "Rel Hardback")) +
  geom_path(aes(y=Acad_RP)) +
#  geom_path(aes(y=Paper_Rel, color = "Rel Paper")) +
  labs(title = "Academic Titles in Religion and Philosophy", 
       subtitle = "Growth in Titles 1998 - 2014", 
       caption = "Sources: Bowker annual of library and 
book trade information (1998-2008)
       Library and Book Trade Almanac (2009-)",
       x = "Year",
       y = "Number of Titles Published")

#create new vector cost * titles published
hard_rel_total <- (pubdata$Hard_Rel*pubdata$Hard_Rel_Price)/1000 
acad_rp_total <- (pubdata$Acad_RP*pubdata$Acad_RP_Price)/1000
paper_rel_total <- (pubdata$Paper_Rel*pubdata$Paper_Rel_Price)/1000

#plot total cost of titles published each year in 1000s
ggplot(pubdata, aes(x = Year)) +
  geom_path(aes(y=acad_rp_total)) +
#  geom_path(aes(y=hard_rel_total, color = "Rel Hardback")) +
#  geom_path(aes(y=paper_rel_total, color = "Rel Paperback")) +
  labs(title = "Total Cost of Academic Titles in Religion and Philosophy", 
       subtitle = "Growth 1998 - 2015", 
       caption = "Sources: Bowker annual of library and 
book trade information (1998-2008)
       Library and Book Trade Almanac (2009-)",
       x = "Year",
       y = "Price per Year in 1000s")

