
#social networking
pattern_1<-"facebook|twiter|plus.google|instagram|tinder"


#multimedia hosting website
pattern_2<-"tube\\.|vimeo|motion|daily|metacafe|videos\\.|movie.*\\.|mp4
|video\\.|movies\\/|movie[a-z]*\\.|video[a-z]*\\.|maza|film|pagalworld\\."


#some pattern for online shoping
pattern_3<-"kart\\.|deal\\.|jabong|myntra|zovi|amazon|baba|
shop\\.|americanswan|bazzar|paytm|
freecharge|yepmee|[E-e]bay|naaptol"

#online cloud storage website
pattern_4<-"multi[a-z]*\\.|[a-z]*host|[a-z]*file[a-z]*\\.|[a-z]*cloud[a-z]*\\.|
upload.*\\.|drive|dropbox"

#music hosting website
pattern_5<-"mp3|song|dl|bolly|music|ganna|tune"


#adult website
pattern_6<-"xnxx\\.|xvdieos\\.|adult|hotgirl|porn|xxx.*\\.|sex|erowapi"

#advertisment website
pattern_7<-"ad.*\\.com|ads.*\\.|market[a-z]*\\."

#netowrking and ISP
pattern_8<-"online.*\\.|track[a-z]*\\.|i2e1.in"

#microsoft/yahoo/google
pattern_9<-"microsoft|bing|google|yahoo"

#movie booking and streaming
pattern_10<-"pvrcinemas|bookmyshow|imdb|rotten"


#travel and resturant
pattern_11<-"trip|adviser|makenytrip|yatra|goibibo|airindia|spicejet|indigo
              dominos|pizza|zomato|foodpanda|justeat|khana|burp"


#introducing new wed detail column
refined_t$web_detail<-NA

for(i in 1:nrow(refined_t)){
  message_1<-refined_t$Website[i]
  message_2<-refined_t$Referer[i]
  message_3<-refined_t$Referer.page[i]
  
  if(grepl(pattern_1,message_1,ignore.case = TRUE)|
     grepl(pattern_1,message_2,ignore.case = TRUE)|
     grepl(pattern_1,message_3,ignore.case = TRUE)){
        
      refined_t$web_detail[i]<-"Social networking"
  }
  
  if(grepl(pattern_6,message_1,ignore.case = TRUE)|
     grepl(pattern_6,message_2,ignore.case = TRUE)|
     grepl(pattern_6,message_3,ignore.case = TRUE)){
    
       refined_t$web_detail[i]<-"Adult Content"
  }  
    
  if(grepl(pattern_2,message_1,ignore.case = TRUE)|
     grepl(pattern_2,message_2,ignore.case = TRUE)|
     grepl(pattern_2,message_3,ignore.case = TRUE)){
    
      refined_t$web_detail[i]<-"multimedia hosting"
  }  
  
  if(grepl(pattern_5,message_1,ignore.case = TRUE)|
     grepl(pattern_5,message_2,ignore.case = TRUE)|
     grepl(pattern_5,message_3,ignore.case = TRUE)){
    
       refined_t$web_detail[i]<-"music hosting"
  }
  
  if(grepl(pattern_3,message_1,ignore.case = TRUE)|
     grepl(pattern_3,message_2,ignore.case = TRUE)|
     grepl(pattern_3,message_3,ignore.case = TRUE)){
   
       refined_t$web_detail[i]<-"eCommerce"
  }
  
  if(grepl(pattern_4,message_1,ignore.case = TRUE)|
     grepl(pattern_4,message_2,ignore.case = TRUE)|
     grepl(pattern_4,message_3,ignore.case = TRUE)){
    
      refined_t$web_detail[i]<-"online cloud"
  }
  

  if(grepl(pattern_7,message_1,ignore.case = TRUE)|
     grepl(pattern_7,message_2,ignore.case = TRUE)){
   
       refined_t$web_detail[i]<-"ad content"
  }
 
   if(grepl(pattern_8,message_1,ignore.case = TRUE)|
     grepl(pattern_8,message_2,ignore.case = TRUE)){
    
    refined_t$web_detail[i]<-"Networking/ISP"
  }
  
  
  if(grepl(pattern_9,message_1,ignore.case = TRUE)|
     grepl(pattern_9,message_2,ignore.case = TRUE)){
    
    refined_t$web_detail[i]<-"microsoft/google/bing"
  }
 
  if(grepl(pattern_10,message_1,ignore.case = TRUE)|
     grepl(pattern_10,message_2,ignore.case = TRUE)){
    
    refined_t$web_detail[i]<-"moview review/ticket booking"
  }
  
  
  if(grepl(pattern_11,message_1,ignore.case = TRUE)|
     grepl(pattern_11,message_2,ignore.case = TRUE)|
     grepl(pattern_11,message_3,ignore.case = TRUE)){
    
    refined_t$web_detail[i]<-"Travel and Resturants"
  }
  
}
source('~/i2ei/user_profile.R')
