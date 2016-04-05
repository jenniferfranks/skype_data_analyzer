#copy data from using skypelogview - http://skypelogview.en.softonic.com/
#delete irrelevant data using excel, save as tab-delimited
#import

library(ggplot2)
library(scales)
calls <- as.data.frame(samplecalldata)

calls$time <- as.Date(strptime(calls$Action.Time, "%m/%d/%Y %H:%M"))

#Distribution of all call length times
hist(calls$Duration, breaks = 100, col = "purple", main = "Call Lengths", xlab = "Hours", xlim = c(0,15))

calls$Month <- as.Date(cut(calls$time, breaks = "month"), start.on.monday = FALSE)
calls$Week <- as.Date(cut(calls$time, breaks = "week", start.on.monday = FALSE))


#Total call time per month
ggplot(data = calls, aes(Month, Duration)) +
  ggtitle("Total Time on Skype Call per Month") + ylab("Duration (hours)") +
  stat_summary(fun.y = sum, geom = "bar", col = "black", fill = "#FF9999") + 
  scale_x_date(labels = date_format("%Y-%m"), date_breaks = "1 month") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) 

#Total call time per week
ggplot(data = calls, aes(Week, Duration)) +
  ggtitle("Total Time on Skype Call per Week") + ylab("Duration (hours)") +
  stat_summary(fun.y = sum, geom = "bar", col = "black", fill = "#FF9999") + 
  scale_x_date(labels = date_format("%Y-%m-%d"), date_breaks = '1 week') +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) 
