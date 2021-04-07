#Setting the Authorization for Extracting Tweets:
api_key<-"ficwRKwRINfYuNu5DT9lxwDoH"
api_secret<-"vZgvjei5rKayL9kULt2wLqzA5PJnRuIy90y13XnrjHLjj558kp"
access_token<-"1183354162848747520-ftyBttNuTnjAZwZSf9bzFOibgFkrmJ"
access_token_secret<-"SkmKZAzQIN1AqNa9GigYjbids9JkoA3zcILQa5ziBVlfl"

#Set up connection between the Twitter app and R:
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

#Required Libraries and installation code
install.packages("twitteR")
library(twitteR)

install.packages("plyr")
library(plyr)

install.packages("ROAuth")
library(ROAuth)

install.packages("stringr")
library(stringr)

install.packages("ggplot2")
library(ggplot2)

install.packages("e1071")
library(e1071)

install.packages("tm")
library(tm)

install.packages("dplyr")
library(dplyr)

install.packages("caret")
library(caret)

#We have to now import files containing the dictionary of positive and negative words
> posText<-read.csv(filename,header=FALSE,stringsAsFactors=FALSE)
str(posText)
negText<-read.csv("Negative-word.csv",header=FALSE,stringsAsFactors=FALSE)
str(negText)
#search for V1 feature, if there just refer this column/feature to the posText object.
posText<-posText$V1

#search for V1 feature/column
posText<-posText$V1
negText<-negText$V1

posText<-unlist(lapply(posText, function(x){str_split(x,"\n")}))
negText<-unlist(lapply(negText, function(x){ str_split(x,"\n")}))

#add some more words into posText and negText
pos.word=c(posText,"upgrade")
neg.word=c(negText,"wtf","wait","waiting","epicfail","mechanical")

#To demonstrate sentiment analysis, we analyzed tweets relating to Amazon, Flipkart and Myntra.
Amazon_tweets=searchTwitter('@Amazon',n=1000)
Flipkart_tweets=searchTwitter('@Flipkart',n=1000)
Myntra_tweets=searchTwitter('@Myntra',n=1000)

#Convert the tweets into text format
Amazon_txt=sapply(Amazon_tweets,function(t) t$getText())
Flipkart_text=sapply(Flipkart_tweets,function(t) t$getText())
Myntra_text=sapply(Myntra_tweets,function(t) t$getText())

#Calculate the number of tweets for each e-commerce company
noof_tweets=c(length(Amazon_txt),length(Flipkart_txt),length(Myntra_txt))

#Combining the text of all these e-commerce companies
Shopping_site<- c(Amazon_txt,Flipkart_txt,Myntra_txt)

#sentiment analysis is written and executed

score.sentiment= function(sentences,pos.word,neg.word){
  sent.scores= sapply(sentences,function(sentence,pos.word,neg.word){
#Removing Punctuations
    sentences=gsub("[[:punct:]]","",sentence)
#Removing Control Characters
    sentences=gsub("[[:cntrl:]]","",sentence)
#Removing digits
    sentences=gsub("//d+","",sentence)
    
#Error handling function when trying to convert lower case
    tryTolower=function(x){
      y=NA
      try_error=tryCatch(tolower(x),error=function(e) e)
      if(!inherits(try_error,"error")){
        y=tolower(x)
      }
      
      return(y)
    }
    sentence=sapply(sentence,tryTolower)
    
#split sentence into words with str_split 
    word.list = str_split(sentence, "\\s+")
    words = unlist(word.list)
    
#Compare words to the dictionaries of positive & negative terms
    pos.matches = match(words, pos.word)
    neg.matches = match(words, neg.word)
    
# get the position of the matched term or NA    
# we just want a TRUE/FALSE
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
# final score
    score = sum(pos.matches) - sum(neg.matches)
    return(score)
  }, pos.word, neg.word)

#Start processing the tweets to calculate the sentiment score.  
  sent.scores = score.sentiment(Shopping_Site, pos.word,neg.word)

  #1. Create a variable in the data frame.
  sent.scores$Shopping_Site = factor(rep(c("Amazon", "Flipkart","Myntra"), noof_tweets))
  
  #2. Calculate positive, negative and neutral sentiments.
  sent.scores$positive <- as.numeric(sent.scores$score >0)
  sent.scores$negative <- as.numeric(sent.scores$score <0)
  sent.scores$neutral <- as.numeric(sent.scores$score==0)
  
  #3. Split the data frame into individual datasets for each Shopping Site
  Amazon_Shopping_Site <- subset(sent.scores, sent.scores$Shopping_Site=="Amazon")
  Flipkart_Shopping_Site <- subset(sent.scores,sent.scores$Shopping_Site=="Flipkart")
  Myntra_Shopping_Site <- subset(sent.scores,sent.scores$Shopping_Site=="Myntra")
  
  #4. Create polarity variable for each data frame.
  Amazon_Shopping_Site$polarity <- ifelse(Amazon_Shopping_Site$score 
                                  >0,"positive",ifelse(Amazon_Shopping_Site$score < 
                                   0,"negative",ifelse(Amazon_Shopping_Site$score==0,"Neutral",0)))
  Flipkart_Shopping_Site$polarity <- ifelse(Flipkart_Shopping_Site$score 
                                  >0,"positive",ifelse(Flipkart_Shopping_Site$score < 
                                   0,"negative",ifelse(Flipkart_Shopping_Site$score==0,"Neutral",0)))
  Myntra_Shopping_Site$polarity <- ifelse(Myntra_Shopping_Site$score 
                                  >0,"positive",ifelse(Myntra_Shopping_Site$score < 
                                   0,"negative",ifelse(Myntra_Shopping_Site$score==0,"Neutral",0)))
  
#Generating Graphs
#Plot 1:Polarity Plot - Customer Sentiments (Amazon)
qplot(factor(polarity), data=Amazon_Shopping_Site, geom="bar",
fill=factor(polarity))+xlab("Polarity Categories") +ylab("Frequency") +
ggtitle("Customer Sentiments - Amazon Shopping Site")

#Plot 2: Customer Sentiment Scores (Amazon Shopping Site)
qplot(factor(score), data=Amazon_Shopping_Site, geom="bar", fill=factor(score))+
xlab("Sentiment Score") + ylab("Frequency") + 
ggtitle("Customer Sentiment Scores - Amazon Shopping Site")

#Plot 3: Polarity Plot - Customer Sentiments (Flipkart)
qplot(factor(polarity), data=Flipkart_Shopping_Site, geom="bar", 
fill=factor(polarity))+xlab("Polarity Categories") + ylab("Frequency") + 
ggtitle(" Customer Sentiments - Flipkart Shopping Site ")

#Plot 4: Customer Sentiment Scores (Flipkart)
qplot(factor(score), data=Flipkart_Shopping_Site, geom="bar", 
fill=factor(score))+xlab("Sentiment Score") + ylab("Frequency") + 
ggtitle("Customer Sentiment Scores - Flipkart Shopping Site")

#Plot 5: Polarity Plot - Customer Sentiments (Myntra)
qplot(factor(polarity), data=Myntra_Shopping_Site, geom="bar", 
fill=factor(polarity))+xlab("Polarity Categories") + ylab("Frequency") + 
ggtitle("Customer Sentiments - Myntra Shopping Site") 

#Plot 6: Customer Sentiment Scores (Myntra)
qplot(factor(score), data=Myntra_Shopping_Site, geom="bar", 
fill=factor(score))+xlab("Sentiment Score") + ylab("Frequency") +
ggtitle("Customer Sentiment Scores - Myntra Shopping Site ")

#Summarizing Scores
datafrm = ddply(sent.scores, c("Shopping_site"),summarise,pos_count=sum( positive ),
                neg_count=sum( negative ),neu_count=sum(neutral))

#Total Count
datafrm$total_count = datafrm$pos_count +datafrm$neg_count + datafrm$neu_count

#Percentage
datafrm$pos_percent_score = round( 100*datafrm$pos_count/datafrm$total_count )
datafrm$neg_percent_score = round( 100*datafrm$neg_count/datafrm$total_count )
datafrm$neu_percent_score = round( 100*datafrm$neu_count/datafrm$total_count )

#Comparison Charts
#Comparison 1 - Positive Comparative Analysis
attach(datafrm)
pie.chart.lbls <-paste(datafrm$Shopping_Site,datafrm$pos_percent_score)
pie.chart.lbls <- paste(pie.chart.lbls,"percent",sep="")
pie(pos_percent_score, labels = pie.chart.lbls, col = rainbow(length(pie.chart.lbls)),
main = "Positive Comparative Analysis - Shopping Site")

#Comparison 2 - Negative Comparative Analysis
pie.chart.lbls <-paste(datafrm$Shopping_Site,datafrm$neg_percent_score)
pie.chart.lbls <- paste(pie.chart.lbls,"percent",sep=" ")
pie(neg_percent_score, labels = pie.chart.lbls, col = rainbow(length(pie.chart.lbls)), 
main = "Negative Comparative Analysis - Shopping Site")

#Comparison 3 - Neutral Comparative Analysis
pie.chart.lbls <-paste(datafrm$Shopping_Site,datafrm$neu_percent_score)
pie.chart.lbls <- paste(pie.chart.lbls,"percent",sep="")
pie(neu_percent_score, labels = pie.chart.lbls, col = rainbow(length(pie.chart.lbls)), 
main = "Neutral Comparative Analysis - Shopping Site")

# Naïve Bayes Algorithm
# Data Preprocessing
write.table(Amazon_Shopping_Site,"your R_Workspace directory/Amazon_Shopping_Site.csv", 
            append=T, row.names=F, col.names=T,sep=",",)
Amazon_Shopping_Site_csv <-read.csv("your R_Workspace directory/Amazon_Shopping_Site.csv", 
                                    header = TRUE, encoding = "UCS-2LE")
View(Amazon_Shopping_Site_csv)

df<- read.csv("Amazon_Shopping_Site_classif1.csv", stringsAsFactors = FALSE)
head(df)

#Randomize the dataset and convert the 'class' variable from character to factor.
set.seed(1)
df <- df[sample(nrow(df)),]
df <- df[sample(nrow(df)),]
head(df)
str(df)
df$class <- as.factor(df$class)

#Bag of Words Tokenization
corpus <- VCorpus(VectorSource(df$text))
corpus
inspect(corpus[1:3])

#Data Cleanup
corpus.clean <- corpus %>% tm_map(content_transformer(tolower)) %>% tm_map(removePunctuation) 
%>% tm_map(removeNumbers) %>% tm_map(removeWords, stopwords(kind="en")) 
%>%tm_map(stripWhitespace)

#Matrix representation of Bag of Words: The Document Term Matrix (DTM)
dtm <- DocumentTermMatrix(corpus.clean)
inspect(dtm[40:50, 10:15])

#We create 70:30 partitions of the dataframe, corpus, and DTM for training and testing purposes.
df.train <- df[1:1200,]
df.test <- df[1201:1554,]
dtm.train <- dtm[1:1200,]
dtm.test <- dtm[1201:1554,]
corpus.clean.train <- corpus.clean[1:1200]
corpus.clean.test <- corpus.clean[1201:1554]
dim(dtm.train)

#reduce the number of features
fivefreq <- findFreqTerms(dtm.train, 5)
length((fivefreq))

dtm.train.nb <- DocumentTermMatrix(corpus.clean.train, control=list(dictionary = fivefreq))
dim(dtm.train.nb)

dtm.test.nb <- DocumentTermMatrix(corpus.clean.test, control=list(dictionary = fivefreq))
dim(dtm.train.nb)

#Working with Naive Bayes algorithm
#Function to convert the word frequencies to yes (presence) and no (absence)labels: 
convert_count <- function(x) {
  y <- ifelse(x > 0, 1,0)
  y <- factor(y, levels=c(0,1), labels=c("No", "Yes"))
  y
}

#Applying the convert_count function to get the final training and testing DTMs
trainNB <- apply(dtm.train.nb, 2, convert_count)
testNB <- apply(dtm.test.nb, 2, convert_count)


#Training the Naive Bayes Model
system.time( classifier <- naiveBayes(trainNB, df.train$class,laplace = 1) )

#Testing the Predictions
#Use the NB classifier we built to make predictions on the test set:
system.time( pred <- predict(classifier, newdata=testNB) )

#Create a truth table by tabulating the predicted class labels with the actual class labels: 
table("Predictions"= pred, "Actual" = df.test$class )

#5. Confusion Matrix
conf.mat <- confusionMatrix(pred, df.test$class)
conf.mat






























  
  
  
  
  
  
  
  
  
  
  
  
  
  



