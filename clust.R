#library for parsing the excel data as dataframe
library(XLConnect)
#extracting the regular pattern from the 
library(stringr)
#library for validating the given url is valid or not
library(RCurl)
library(bitops)


sample_dat <- readWorksheetFromFile("C:/Users/ankitccuser/Downloads/i2ei/sample_data.xls", sheet=1)


#remove all the rows having null entries from dataframe
refined<-sample_dat[sample_dat$Website!='null',]

refined<-refined[refined$Referer!='null',]
 refined<-refined[refined$User.Mac!="null",]

#after removing rows having null entries in website and referer column
#dataset extensively reduced

#data frame gather the site
site_frame<-data.frame(table(refined$Website))
colnames(site_frame)<-c("Website","Website_freq")

q<-quantile(site_frame$Website_freq)
site_frame_t<-site_frame[site_frame$Website_freq>q[3],]

#extract all Ip values and store them into a new data file
ip<-read.csv("C:/Users/ankitccuser/Documents/i2ei/ip address.txt", sep = "")
colnames(ip)<-c("ipaddress")

#remove ip values from the dataset
for(j in 1:nrow(ip)){
    site_frame_t<-site_frame_t[site_frame_t$Website!=as.character(ip$ipaddress[j]),]
}

#file contain no null websitepage and website  with only ip adress as input
refined<-merge(x=refined,y=site_frame_t,by.x = "Website",by.y = "Website")

#asscoaite the devie column with each row entry,
#to know from which type of device used for browseing 
pattern=";.[^AUe][A-Za-z]*.[A-Z]*[0-9]*|Sansui-SA50+"

for(i in 1:nrow(refined)){
  
  message<-refined$Browser.Agent[i]

  refined$device[i]<-str_extract(message,pattern)
  
}

#just to remove semi colon that we introduced in the regex
pattern_1<-"[^;][A-Za-z]*.[A-Z]*[0-9]*|Sansui-SA50+"
pattern_2<-".com|.net|.org|.mobi|.uk|.cn|.in|.vc|.tv|.biz|.me|.info"
for(i in 1:nrow(refined)){
  
  message<-refined$device[i]
  message_2<-refined$Website[i]
  refined$device[i]<-str_extract(message,pattern_1)
  refined$domain_name[i]<-str_extract(message_2,pattern_2)
}

#know we test wether given website url are valid or not
#for(i in 1:nrow(refined)){
 #URL<-refined$Website[i]
  #refined$url_exist[i]<-url.exists(URL)
  
#}


domain_name<-c(".com",".net",".org",".mobi",".uk",".cn",".in",".vc",".tv",".biz",".me",".info")

domain_type<-c("Commercial","Internet based services","non profit","mobile website",
                           "commercial/united kingdom","business/china","indian website","NULL","multimedia website",
                              "business","NUll","resource website")

web_domain<-data.frame(domain_name,domain_type)
refined_t<-merge(x=refined,y=web_domain,by.x = "domain_name",by.y = "domain_name")

source('~/i2ei/regex_pattern_extraction.R')














































