#List Of Packages Used
library(RColorBrewer) 
library(tm)
library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(base64enc)
library(SnowballC)
library(ggplot2)
library(maps)


consumerKey <- "eOtcK9qJpjcObGUPv6SfTFZFE"
consumerSecret <- "TedGta8dDigiQcpKJ68AleIlfaHL7nqdVdCH2qppgD7wLYE0Tm"
accessToken <- "896758586243653632-6RCrl6Yia8uR0YbjBor38RxbjCWCqFm"
accessTokenSecret <- "QYLajXrqdbMYFKwno9itPNo4LVPsVuccOBSyxzfMfdCUF"


requestURL<- "https://api.twitter.com/oauth/request_token"
accessURL<- "https://api.twitter.com/oauth/access_token"
authURL<- "https://api.twitter.com/oauth/authorize"

setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)

#search TWitter
users<- searchTwitteR("#Unpacked2018", resultType="recent",n=3000, lang="en")
#Converting into Dataframe 
tweet.df = do.call("rbind",lapply(users,as.data.frame))


#Plotting data on map
map('world')
points(tweets.df$longitude,tweets.df$latitude, pch=20, cex=1, col="red")

#Viewing the data
View(tweet.df)

#Reading sentiment analysis data from Txt document
pos.words = scan('./positive-words.txt', what='character', comment.char=';')
neg.words = scan('./negative-words.txt', what='character', comment.char=';')

#Appending some more words to actual words
pos.words = c(pos.words, 'new','nice' ,'good', 'horizon')
neg.words = c(neg.words, 'wtf', 'behind','feels', 'ugly', 'back','worse' , 'shitty', 'bad', 'no','freaking','sucks','horrible')

#converting Into dataFrame
test <-ldply(users,function(t)t$toDataFrame())

#calcuating result
result <- score.sentiment(test$text,pos.words,neg.words)

#summarlizing data
summary(result$score)

#Histogram
hist(result$score,col="yellow", main="Score of tweets",ylab=" Count of tweets")

#Count No of Tweets
count(result$score)

#ploting the tweets on qplot
qplot(result$score,xlab = "Score of tweets")

#score Sentiment function 
#Used to remove all unwanted data 
score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
    require(plyr)
    require(stringr)
    scores = laply(sentences, function(sentence, pos.words, neg.words) {
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    sentence = tolower(sentence)
    word.list = str_split(sentence, '\\s+')
    words = unlist(word.list)
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    score <- sum(pos.matches) - sum(neg.matches)
    return(score)
    }, pos.words, neg.words, .progress=.progress )
    
    scores.df = data.frame(score=scores, text=sentences)
    return(scores.df)
}

    






