
#remove all the row having no web detail
refined_ts<-refined_t[!is.na(refined_t$web_detail),]

write.csv(refined_ts,"C:/Users/ankitccuser/Documents/i2ei/dataset.csv")

#split the data frame based on user mac id
user_t<-split(refined_ts,refined_ts$User.Mac)

#declared a empty dataframe with appropriate number of columns
user_profile <- unique( refined_ts[ , c(1,3,10,11,12) ] )

user_profile[c( "Adult Content",                "multimedia hosting",          
                "Networking/ISP",               "ad content",                  
                "microsoft/google/bing",        "moview review/ticket booking",
                "music hosting",                "eCommerce",                   
                "online cloud",                 "Social networking",           
                "Travel and Resturants","News/magzines","total")]<-0


for(i in 1:length(user_t)){
  tmp<-user_t[[i]]
  
  for(j in 1:nrow(user_profile)){
    
    if(user_profile$User.Mac[j]==tmp$User.Mac[1]){
      
      len<-nrow(tmp)
      burp<-data.frame(table(tmp$web_detail))
      
      
      for(k in 5:ncol(user_profile)){
        
        for(m in 1:nrow(burp)){
          
          if(colnames(user_profile)[k]==as.character(burp$Var1[m])){
            
            user_profile[j,k]<-burp$Freq[m]
            user_profile$total[j]<-len
          }
          
        }
      }
      
      
    }
  }
  
  
  
  
  
}


write.csv(user_profile,"C:/Users/ankitccuser/Documents/i2ei/user_profile.csv",row.names = F)