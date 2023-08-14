# Data

## MongoDB

in `Mongo` shell to check the location of your MongoDB files

`db.adminCommand("getCmdLineOpts")`

## WRDS

Retrieve data from WRDS




```r
# to set up connection from R to WRDS (https://wrds-www.wharton.upenn.edu/pages/support/programming-wrds/programming-r/r-from-your-computer/)
library(RPostgres)
library(dplyr)

# I've set up wrds connection before hand. Please use your username and password here.

# wrds <- dbConnect(Postgres(),
#                   host='wrds-pgdata.wharton.upenn.edu',
#                   port=9737,
#                   dbname='wrds',
#                   sslmode='require',
#                   user='')

# Check variables (column headers) in COMP ANNUAL FUNDAMENTAL
#uses the already-established wrds connection to prepare the SQL query string and save the query as the result res.
# check avaiable databases: https://wrds-web.wharton.upenn.edu/wrds/tools/variable.cfm?vendor_id=7
res <- dbSendQuery(wrds, "select column_name
                   from information_schema.columns
                   where table_schema='compa'
                   and table_name='funda'
                   order by column_name")
data <- dbFetch(res, n=-1) # fetches the data that results from running the query res against wrds and stores it as data
dbClearResult(res) # closes the connection
head(data)

# select everything
res <- dbSendQuery(wrds, "select * from compa.funda")

# from compa.funda

# only select the following variables
res <- dbSendQuery(wrds, "select gvkey, datadate, fyear, indfmt, consol, popsrc, datafmt, tic, cusip, conm, curcd, fyr, act, at, bkvlps, ceq, ch, che, dltt, dlc, emp, np, exchg, cik, costat, naicsh,mkvalt from compa.funda") #check variables from (https://wrds-web.wharton.upenn.edu/wrds/ds/comp/funda/index.cfm?navId=80)

# res <- dbSendQuery(wrds, "select gvkey, gp from compa.funda") #check variables from
data1 <- dbFetch(res, n=-1)
dbClearResult(res)

data = data1 %>%
    distinct(gvkey,datadate,fyear,tic,conm,.keep_all = T)
```

## YouTube

-   [YouTube Ads](https://www.youtube.com/intl/en_us/ads/how-it-works/measure-your-results/)\
-   [YouTube Analytics and Reporting APIs](https://developers.google.com/youtube/reporting): All YouTube Analytics and YouTube Reporting API requests must be authorized by the channel or content owner that owns the requested data

### OAuth

Go to [link](https://console.cloud.google.com/apis/api/youtube.googleapis.com) to access your API




```r
library(tuber)
app_id = "YOUR APP ID"
app_secret = "YOUR APP SECRET"
yt_oauth(app_id, app_secret)


get_stats(video_id = "N708P-A45D0")
```

Note for Ubuntu user


```r
httr::set_config(httr::config( ssl_verifypeer = 0L ) )
```

Get info about a video


```r
get_video_details(video_id="N708P-A45D0")
```

Get caption of a video


```r
get_captions(video_id="yJXTXN4xrI8")
```

Search Videos


```r
res <- yt_search(term = "test")
head(res[, 1:3])
```

Get Comments of a video


```r
res <- get_comment_threads(c(video_id="N708P-A45D0"))
head(res)
```

Get All the Comments Including Replies


```r
get_all_comments(video_id = "a-UQz7fqR3w")
```

Get statistics of all the videos in a channel


```r
a <- list_channel_resources(filter = c(channel_id = "UCT5Cx1l4IS3wHkJXNyuj4TA"), part="contentDetails")

# Uploaded playlists:
playlist_id <- a$items[[1]]$contentDetails$relatedPlaylists$uploads

# Get videos on the playlist
vids <- get_playlist_items(filter= c(playlist_id=playlist_id)) 

# Video ids
vid_ids <- as.vector(vids$contentDetails.videoId)

# Function to scrape stats for all vids
get_all_stats <- function(id) {
  get_stats(id)
} 

# Get stats and convert results to data frame 
res <- lapply(vid_ids, get_all_stats)
res_df <- do.call(rbind, lapply(res, data.frame))

head(res_df)
```

### API




```r
require(curl)
require(jsonlite)
library(kableExtra)
library(dplyr)
library(ggplot2)
library(plotly)
library(reshape2)

API_key = "YOUR API KEY"

getstats_video<-function(video_id,API_key){
 
  url=paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=",video_id,"&key=",API_key)
  result <- fromJSON(txt=url)  
  salida=list()
  return(data.frame(name=result$items$snippet$channelTitle, result$items$statistics,title=result$items$snippet$title,date=result$items$snippet$publishedAt,descrip=result$items$snippet$description))
}

get_playlist_canal<-function(id,API_key,topn=15){
  
  url=paste0('https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&playlistId=',id,'&key=',API_key,'&maxResults=',topn)
  
  result=fromJSON(txt=url)
  return(data.frame(result$items$contentDetails))
}

getstats_canal<-function(id,API_key){

url=paste0('https://www.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=',id,'&key=',API_key)
  
result <- fromJSON(txt=url)   
return(data.frame(name=result$items$snippet$title,result$items$statistics,pl_list_id=result$items$contentDetails$relatedPlaylists))
  
}

getall_channels<-function(ids,API_key,topn=5){
  
  videos=lapply(ids,FUN=get_playlist_canal,API_key=API_key,topn=topn) %>% bind_rows()
  
  stats=lapply(videos[,1],FUN=getstats_video,API_key=API_key)
  stats=bind_rows(stats)
  stats$vid_id=videos[,1]
  return(stats)
}
```

Statistics per Channel


```r
can_st=lapply(comp_data$cha_id,FUN = getstats_canal,API_key=API_key)
can_st=bind_rows(can_st)
can_st$viewCount=as.numeric(can_st$viewCount)
can_st[,1:6] %>% kable() %>%kable_styling()
```


```r
can_st$viewCount=round(as.numeric(can_st$viewCount)/1000000,2)
p1=can_st %>% ggplot(aes(x=reorder(name,viewCount),y=viewCount,fill=name))+
geom_bar(stat="sum")+guides(size=F)+coord_flip()+scale_fill_manual(values = c("red", "darkblue", "yellow2"))+
geom_text(inherit.aes = T,aes(label=paste(viewCount,"M")),nudge_y =0,angle = 90)+
labs(x="Total Visualizations(Millions)",y="Visualizations",fill="")+
theme(legend.position = "top")+mytheme3
  
  ggplotly(p1,tooltip=c("name","viewCount"))  %>% 
    layout(legend = list(orientation = "h",x = 0.01, y = -0.1,autosize=F))  
```

Information on Individual Videos per Channel


```r
var_to_see="dislikeCount" #favoriteCount or commentCount

info=getall_channels(ids = can_st$pl_list_id.uploads,API_key = API_key,topn =20)


 datacond=melt(info[,c(1:6,8)],id.vars = c("name","date"))
 datacond$date=as.Date(datacond$date)
 datacond$value=as.numeric(datacond$value)
    
    
ggplot(filter(datacond,variable==var_to_see),aes(x=as.Date(date),y=value,fill=name))+
geom_bar(stat="sum")+labs(x=var_to_see,y="",fill="")+guides(size=FALSE)+scale_fill_manual(values = c("red", "darkblue", "yellow2"))+theme(legend.position = "top")+
  scale_x_date(limits =as.Date(c(as.Date(min(datacond$date)),as.Date(Sys.time()))),date_breaks  ="month",date_labels="%b %y")+theme(legend.position = "top")+mytheme2 
```

### Python

[Pytube](https://github.com/pytube/pytube)


```python
# from pytube import YouTube
# YouTube('https://youtube.com/watch?v=2lAe1cqCOXo').streams.first().download()
```


```python
import requests
import json
r = requests.get("http://gdata.youtube.com/feeds/api/standardfeeds/top_rated?v=2&alt=jsonc")
#r.text
data = json.loads(r.text)
data
# for item in data['data']['items']:
#   print "Video Title: %s" % (item['title'])
#   print "Video Category: %s" % (item['category'])
#   print "Video ID: %s" % (item['id'])
#   print "Video Rating: %f" % (item['rating'])
#   print "Embed URL: %s" % (item['player']['default'])
```

Using `BeautifulSoup`


```python
from requests_html import HTMLSession 
from bs4 import BeautifulSoup as bs # importing BeautifulSoup

# sample youtube video url
video_url = "https://www.youtube.com/watch?v=jNQXAC9IVRw"
# init an HTML Session
session = HTMLSession()
# get the html content
response = session.get(video_url)
# execute Java-script
response.html.render(sleep=1)
# create bs object to parse HTML
soup = bs(response.html.html, "html.parser")
# write all HTML code into a file
open("video.html", "w", encoding='utf8').write(response.html.html)
```

Generate random video


```python
import json
import urllib.request
import string
import random

count = 50
API_KEY = 'your_key'
random = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(3))

urlData = "https://www.googleapis.com/youtube/v3/search?key={}&maxResults={}&part=snippet&type=video&q={}".format(API_KEY,count,random)
webURL = urllib.request.urlopen(urlData)
data = webURL.read()
encoding = webURL.info().get_content_charset('utf-8')
results = json.loads(data.decode(encoding))

for data in results['items']:
    videoId = (data['id']['videoId'])
    print(videoId)
    #store your ids
```

Random used by YouTube API, [test](https://developers.google.com/youtube/v3/docs/search/list?apix=true&apix_params=%7B%22part%22%3A%5B%22snippet%22%5D%2C%22maxResults%22%3A25%2C%22q%22%3A%22surfing%22%7D)


```python
# -*- coding: utf-8 -*-

# Sample Python code for youtube.search.list
# See instructions for running these code samples locally:
# https://developers.google.com/explorer-help/guides/code_samples#python

import os

import google_auth_oauthlib.flow
import googleapiclient.discovery
import googleapiclient.errors

scopes = ["https://www.googleapis.com/auth/youtube.force-ssl"]

def main():
    # Disable OAuthlib's HTTPS verification when running locally.
    # *DO NOT* leave this option enabled in production.
    os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

    api_service_name = "youtube"
    api_version = "v3"
    client_secrets_file = "YOUR_CLIENT_SECRET_FILE.json"

    # Get credentials and create an API client
    flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
        client_secrets_file, scopes)
    credentials = flow.run_console()
    youtube = googleapiclient.discovery.build(
        api_service_name, api_version, credentials=credentials)

    request = youtube.search().list(
        part="snippet",
        maxResults=25,
        q="surfing"
    )
    response = request.execute()

    print(response)

if __name__ == "__main__":
    main()
```

Another way, but this is a dirty crawler, not for production


```python
import re, urllib
from random import randint

def random_str(str_size):
    res = ""
    for i in xrange(str_size):
        x = randint(0,25)
        c = chr(ord('a')+x)
        res += c
    return res

def find_watch(text,pos):
    start = text.find("watch?v=",pos)
    if (start<0):
        return None,None
    end = text.find(" ",start)
    if (end<0):
        return None,None

    if (end-start > 200): #silly heuristics, probably not a must
        return None,None

    return text[start:end-1], start


def find_instance_links():
    base_url = 'https://www.youtube.com/results?search_query='
    url = base_url+random_str(3)
    #print url

    r = urllib.urlopen(url).read()

    links = {}

    pos = 0
    while True:
        link,pos =  find_watch(r,pos)
        if link == None or pos == None:
            break
        pos += 1
        #print link
        if (";" in link):
            continue
        links[link] = 1

    items_list = links.items()

    list_size = len(items_list)
    selected = randint(list_size/2,list_size-1)
    return items_list[selected][0]


for i in xrange(1000):
    sleep(randint(7,20)) # pause randomly between 7 and 20 seconds
    link = find_instance_links()
    print link
```

## Consumer Expenditure

-   A consumer unit: "a single person, or group of person who live together and who share responsibilities for most major expenditures."

-   The "Reference Person" is **the first person named** when the respondent is asked, "Who is responsible for owning or renting this home?"

-   2 components to the Consumer Expenditure:

    -   Interview survey

        -   for "big ticket" and recurring expenditures, and global estimates on others
        -   every three months for four quarter
        -   rotating-panel survey
        -   6,000 consumer units each quarter

    -   Diary survey

        -   small-ticket, frequently purchased items

        -   independent from the interview survey

        -   about 14,000 diaries within families each year

-   Table format

    -   annual

        -   Jan to Dec: since 1984

        -   July to June: since 2013

    -   two-year (Jan year 1 - Dec year 2)

        -   since 1986

-   Experimental research

    -   all consumer units (available on request)

    -   E.g., income tables, generational groups (e.g., millennial, gen X)

## Gender, Age, Nationality

Now, we can make credible prediction about a person's gender, age, and nationality based on his or her name.

The APIs are

-   `https://genderize.io/`
-   `https://agify.io/`
-   `https://nationalize.io/`

## Google Trends

Online search volume and news reporting show a strong correlation, while academic publishing lag behind online public interest due to its delayed review and publication process [@nghiem2016]. This result was interpreted as news serves as a conductor between the research and the public community.

Google Trends only return

| Data Granularity | Data Window                  |
|------------------|------------------------------|
| Hourly Data      | Last 7 days                  |
| Daily Data       | Less than 9 months           |
| Weekly Data      | between 9 months and 5 years |
| Monthly Data     | Longer than 5 years          |

Since the data is indexed for the chosen time window, for the same keywords with different time windows might result in different index values.

### Relative Search


```r
library(gtrendsR)

# for proxy 
# setHandleParameters(
#     user = "xxxx",
#     password = "*******",
#     domain = "mydomain",
#     proxyhost = "10.111.124.113",
#     proxyport = 8080
# )

keywords = c("7eleven", "3m")
country = c("US")
time = ("2010-01-01 2012-01-30") # earliest is 2004
channel = "web"

trends = gtrends(keyword = keywords, geo = country, time = time, gprop = channel)

# objects
names(trends)

# this is weekly data only
time_trend <- trends$interest_over_time
```

The value is relative to the maximum volume (not absolute search volume)

channel type ("web" (default), "news", "images", "froogle" , "youtube")


```r
library(ggplot2)
 
plot <-
    ggplot(data = time_trend, aes(
        x = date,
        y = hits,
        group = keyword,
        col = keyword
    )) +
    geom_line() + xlab('Time') + ylab('Relative Interest (weekly)') + theme_bw() +
    theme(
        legend.title = element_blank(),
        legend.position = "bottom",
        legend.text = element_text(size = 12)
    ) + ggtitle("Google Search Volume")
plot
```

Smoothing to remove seasonality


```r
plot <-
    ggplot(data = time_trend, aes(
        x = date,
        y = hits,
        group = keyword,
        col = keyword
    )) +
    geom_smooth(span = 0.5, se = FALSE) + xlab('Time') + ylab('Relative Interest') +
    theme_bw() + theme(
        legend.title = element_blank(),
        legend.position = "bottom",
        legend.text = element_text(size = 12)
    ) + ggtitle("Google Search Volume")

plot
```

Alternatively, we can use the plot function in the `gtrendsR` package readily


```r
plot(gtrendsR::gtrends(
    keyword = keywords,
    geo = country,
    time = time
))
```

1.  Scaling method (overlapping method) (recommended)

A way to get daily data from `gtrendsR` readily is proposed by [Alex Dyachenko](http://alexdyachenko.com/all/how-to-get-daily-google-trends-data-for-any-period-with-r/)

1.  Get daily estimates for the window less than 9 months

2.  Get monthly estimates for your desired time frame

3.  Multiply daily estimates for each month from step 1 by their weights from step 2

4.  Concatenation method (normalization/[dailydata](https://github.com/GeneralMills/pytrends/blob/master/pytrends/dailydata.py) method)

Daily data are concatenated from 1-month queries and normalized by weekly trends data, which has been done in this [post](https://medium.com/@bewerunge.franz/google-trends-how-to-acquire-daily-data-for-broad-time-frames-b6c6dfe200e6)

From this [post](https://towardsdatascience.com/reconstruct-google-trends-daily-data-for-extended-period-75b6ca1d3420), we can be sure that the scaling method is better than the normalization method

Rate limit:

-   1,400 requests in 4 hours


```r
library(gtrendsR)
library(tidyverse)
library(lubridate)

get_daily_gtrend <-
    function(keyword = c('7eleven', '3M'),
             geo = 'US',
             from = '2013-01-01',
             to = '2013-02-15') {
        if (ymd(to) >= floor_date(Sys.Date(), 'month')) {
            to <- floor_date(ymd(to), 'month') - days(1)
            
            if (to < from) {
                stop("Specifying \'to\' date in the current month is not allowed")
            }
        }
        
        aggregated_data <-
            gtrends(keyword = keyword,
                    geo = geo,
                    time = paste(from, to))
        if (is.null(aggregated_data$interest_over_time)) {
            print('There is no data in Google Trends!')
            return()
        }
        
        mult_m <- aggregated_data$interest_over_time %>%
            mutate(hits = as.integer(ifelse(hits == '<1', '0', hits))) %>%
            group_by(month = floor_date(date, 'month'), keyword) %>%
            summarise(hits = sum(hits)) %>%
            ungroup() %>%
            mutate(ym = format(month, '%Y-%m'),
                   mult = hits / max(hits)) %>%
            select(month, ym, keyword, mult) %>%
            as_tibble()
        
        pm <- tibble(
            s = seq(ymd(from), ymd(to), by = 'month'),
            e = seq(ymd(from), ymd(to), by = 'month') + months(1) - days(1)
        )
        
        raw_trends_m <- tibble()
        
        for (i in seq(1, nrow(pm), 1)) {
            curr <- gtrends(keyword,
                            geo = geo,
                            time = paste(pm$s[i], pm$e[i]))
            if (is.null(curr$interest_over_time))
                next
            print(paste(
                'for',
                pm$s[i],
                pm$e[i],
                'retrieved',
                count(curr$interest_over_time),
                'days of data (all keywords)'
            ))
            raw_trends_m <- rbind(raw_trends_m,
                                  curr$interest_over_time)
        }
        
        trend_m <- raw_trends_m %>%
            select(date, keyword, hits) %>%
            mutate(ym = format(date, '%Y-%m'),
                   hits = as.integer(ifelse(hits == '<1', '0', hits))) %>%
            as_tibble()
        
        trend_res <- trend_m %>%
            left_join(mult_m) %>%
            mutate(est_hits = hits * mult) %>%
            select(date, keyword, est_hits) %>%
            as_tibble() %>%
            mutate(date = as.Date(date))
        
        return(trend_res)
    }

daily_trend <- get_daily_gtrend(
    keyword = c('7eleven', '3M'),
    geo = 'US',
    from = '2013-01-01',
    to = '2013-02-01'
)
head(daily_trend)
```

This method was used in a research paper [@risteski2014]

Similarly, without the `gtrendsR` package, you can follow [Erik Johansson's method](http://erikjohansson.blogspot.com/2014/12/creating-daily-search-volume-data-from_8.html), but the Google no longer has his URL: <http://www.google.com/trends/trendsReport?hl=en-US&q=> so you might have to figure out the new URL

Other methods include:

-   [@liugoogle2019]

### Absolute Search

See [Google Trend Dataset](https://cloud.google.com/blog/products/data-analytics/top-25-google-search-terms-now-in-bigquery?utm_source=youtube&utm_medium=unpaidsoc&utm_campaign=CDR_swo_analytics_trendsvideo_trendsdatasetblog_071421&utm_content=description) available via [BigQuery](https://cloud.google.com/bigquery)

## Baidu Index

see [@liu2019] on how to use Java-based spider to get search volume data
