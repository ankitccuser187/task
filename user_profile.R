
#remove all the row having no web detail
refined_ts<-refined_t[!is.na(refined_t$web_detail),]

#split the data frame based on user mac id
user_t<-split(refined_ts,refined_ts$User.Mac)

#declared a empty dataframe with appropriate number of columns
user_profile <- unique( refined_ts[ , c(3,10) ] )

user_profile[c( "Adult Content",                "multimedia hosting",          
                "Networking/ISP",               "ad content",                  
                "microsoft/google/bing",        "moview review/ticket booking",
                "music hosting",                "eCommerce",                   
                "online cloud",                 "Social networking",           
                "Travel and Resturants","total")]<-0


for(i in 1:length(user_t)){
  tmp<-user_t[[i]]
  
  for(j in 1:nrow(user_profile)){
    
    if(user_profile$User.Mac[j]==tmp$User.Mac[1]){
      
      len<-nrow(tmp)
      burp<-data.frame(table(tmp$web_detail))
      
      
      for(k in 3:ncol(user_profile)){
        
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
final_data<-data.frame(refined_t$domain_name,
                       refined_t$User.Mac,
                       refined_t$domain_type,refined_t$web_detail)
colnames(final_data)<-c("domain_name","User_Mac","domain_type","web_detail")
final_data<-unique(final_data)

user_profile<-merge(x=final_data,y=user_profile,
                    by.x = "User_Mac",by.y = "User.Mac",all = T)

user_profile<-unique(user_profile)

write.csv(user_profile,"C:/Users/ankitccuser/Documents/i2ei/user_profile.csv",row.names = F)