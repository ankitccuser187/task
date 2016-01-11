library(corrplot)

#function to adjust the size of window so plot 
resize.win <- function(Width=6, Height=6)
   {
         # works for windows
           dev.off() # dev.new(width=6, height=6)
         windows(record=TRUE, width=Width, height=Height)
     }
hc<-user_profile[,c(1,6:17)]
hc<-unique(hc)
hc<-na.omit(hc)

web_cor<-round(cor(data.matrix(hc[,2:13])),3)
web_cor[is.na(web_cor)]<-0

#corelationplot
resize.win(7,10)
corrplot(web_cor,type="upper", order="hclust", tl.col="black", tl.srt=45)

write.csv(web_cor,"C:/Users/ankitccuser/Documents/i2ei/websites_corr.csv")


#stacked bar plot
resize.win(10,10)
counts<-table(user_profile$web_detail,data.matrix(user_profile$User.Mac))
barplot(counts, main="user intrest based on  by surfing",
        xlab="distinct users", col=c("darkblue","red","orange","yellow","green","pink","purple","grey","#D0FF14","#009698","#B2592D","#FD9800"),
        legend = rownames(counts))