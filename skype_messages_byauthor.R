#This programs assumes you have a tab delimited file of data generated from Skyperious.
# Skyperious link: https://suurjaak.github.io/Skyperious/
#
#1. export data from Skyperious
#2. copy and paste into excel, save as tab delimited
#3. import dataset 


library(epitools)
library(ggplot2)
library(scales)

df <- as.data.frame(samplemessagedata) 

sapply(df, function(x)sum(grepl("skyper1", x)))
sapply(df, function(x)sum(grepl("skyper2", x)))

df$timestamp = (strptime(df$Time, "%m/%d/%Y %H:%M"))
df$Week <- as.Date(cut(df$timestamp, breaks = "week", start.on.monday = FALSE))
df$Month <- as.Date(cut(df$timestamp, breaks = "month", start.on.monday = FALSE))
df$Quantity <- rep(1, length(timestamp))

#Weekly stacked bar plot
ggplot(data = df, aes(Week)) +
  ggtitle("Skype Messages") + ylab("# Messages") +
  geom_bar(aes(fill = Skype.Name)) +
  scale_x_date(labels = date_format("%Y-%m-%d"), date_breaks = '1 week') +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) 

#Weekly side-by-side bar plot
ggplot(data = df, aes(Week)) +
  ggtitle("Skype Messages") + ylab("# Message") +
  geom_bar(aes(fill = Skype.Name), position = position_dodge()) +
  scale_x_date(labels = date_format("%Y-%m-%d"), date_breaks = '1 week') +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) 

#Monthly side-by-side bar plot
ggplot(data = df, aes(Month)) +
  ggtitle("Skype Messages") + ylab("# Message") +
  geom_bar(aes(fill = Skype.Name), position = position_dodge()) +
  scale_x_date(labels = date_format("%Y-%m-%d"), date_breaks = '1 month') +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))


#as Line graphs instead of Bar plots...
df2 <- aggregate(Quantity ~ Week + Skype.Name, data = df, sum)
df3 <-aggregate(Quantity ~ Month + Skype.Name, data = df, sum)

ggplot(df2, aes(Week, Quantity)) + geom_line(aes(color = Skype.Name))+ 
  ylab("Weekly Messages") +
  ggtitle("Skype Messages Sent") +
  scale_x_date(labels = date_format("%Y-%m-%d")) + 
  ylab("Weekly Messages")

ggplot(df3, aes(Month, Quantity)) + geom_line(aes(color = Skype.Name))+ 
  ylab("Monthly Messages") +
  ggtitle("Skype Messages Sent") +
  scale_x_date(labels = date_format("%Y-%m-%d")) + 
  ylab("Number of Messages")
