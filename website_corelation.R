library(corrplot)

hc<-user_profile[,c(1,6:16)]
hc<-unique(hc)
hc<-na.omit(hc)

web_cor<-round(cor(hc[,2:12]),3)
write.csv(web_cor,"C:/Users/ankitccuser/Documents/i2ei/websites_corr.csv")