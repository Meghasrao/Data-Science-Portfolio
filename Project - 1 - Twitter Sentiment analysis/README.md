TABLE OF CONTENTS
1. Introduction 
>  Project Background

>  What is Sentiment Analysis?

>  Why do we need Sentiment Analysis?

>  Twitter Analytics with R

2. Problem Definition 
>  Part I – Data and Packages

>  Part II – Algorithm

3. Implementation Prerequisites

>  Twitter Application

>  Packages

4. Solution Statement
>  Sentiment Analysis

>  Naïve Bayes Classification


# INTRODUCTION
## PROJECT BACKGROUND
Social media, as a platform for socializing and communicating, has evolved greatly over the past decade. It now serves 
as medium for people to express their views, displeasures and appreciation to people and companies about their 
services and products. Because of this openness and ease to share feedback, companies target social media to 
understand their customers better. This project will help us understand how consumer sentiment extracted from the 
tweets through machine learning can be used to generate insights regarding product acceptability and performance in 
the market.

## WHAT IS SENTIMENT ANALYSIS?
Sentiment analysis is the most common text classification tool that analyses an incoming message and tells whether 
the underlying sentiment is positive, negative or neutral.
Sentiment analysis is the process of determining whether a piece of writing is positive, negative or neutral. A sentiment 
analysis system for text analysis combines natural language processing (NLP) and machine learning techniques to 
assign weighted sentiment scores to the entities, topics, themes and categories within a sentence or phrase.

## WHY DO WE NEED SENTIMENT ANALYSIS?
Sentiment analysis systems allows companies to derive information from unstructured texts by automating business 
processes, getting actionable insights and saving hours of manual data processing, in other words, by making teams 
more efficient.
Some of the advantages of sentiment analysis includes the following:

- **Scalability:**
There’s just too much data to process manually like, thousands of tweets, customer support conversations, or customer 
reviews. Sentiment analysis allows to process data at a faster rate in an efficient and cost-effective way.

- **Real-time analysis:**
We can use sentiment analysis to identify critical information that allows situational awareness during specific 
scenarios in real-time. Like, is there a PR crisis in social media about to burst? An angry customer that is about to 
churn? A sentiment analysis system can help you immediately identify these kinds of situations and take action.

- **Consistent criteria:**
Text analysis is a subjective task which is heavily influenced by personal experiences, thoughts, and beliefs. By using 
a centralized sentiment analysis system, companies can apply the same criteria to all of their data. This helps to reduce 
errors and improve data consistency.

## TWITTER ANALYTICS WITH R
**Text analysis** in particular has become well established in R. There is a vast collection of dedicated text processing 
and text analysis packages, from low-level string operations to advanced text modeling techniques such as fitting 
Latent Dirichlet Allocation models, R provides it all. One of the main advantages of performing text analysis in R is 
that it is often possible, and relatively easy, to switch between different packages or to combine them. Recent efforts 
among the R text analysis developers’ community are designed to promote this interoperability to maximize flexibility 
and choice among users.4 As a result, learning the basics for text analysis in R provides access to a wide range of 
advanced text analysis features.
**Twitter** is an online microblogging tool that disseminates more than 400 million messages per day, including vast 
amounts of information about almost all industries from entertainment to sports, health to business etc. One of the best 
things about Twitter — indeed, perhaps its greatest appeal — is in its accessibility. It’s easy to use both for sharing 
information and for collecting it.


# PROBLEM DEFINITION

In this project, the aim is to create insightful graphs that indicate consumer sentiment towards e-commerce websites 
such as Amazon, Flipkart and Myntra. In addition, training will be undertaken for the Naïve Bayes classifiers to 
classify the tweets according to their overall sentiment and check the accuracy of the results.

## PART I : DATA AND PACKAGES

- Extracting around 1,000 tweets about Amazon, Flipkart and Myntra and prepare a data using various cleaning steps. 
- The polarity and sentiment score for each tweet is calculated and used for creating individual and comparative plots.
- Various packages and data cleaning methods are used for data preparation.
- Separate data files (csv) are created to analyze positive, negative and neutral sentiments.

## PART II : ALGORITHM
- Naïve Bayes (Supervised Algorithm) is used for the prediction of tweet sentiments as positive, negative and neutral.
- We will split the algorithm as follows

1. Data Collection
2. Exploring and Preparing data
   - Cleaning and Standardizing text data
   - Splitting text documents into words
   - Creating Training and test data sets
   - Visualizing text data – Word Clouds
   - Creating indicator features for frequent words
3. Training a model on the data
4. Evaluating Model Performance
5. Improving Model Performance


# IMPLEMENTATION PREREQUISITES

## TWITTER APPLICATION

1.	In order to create an application, we will need Twitter login ID. 
2.	Sign in at [Twitter Developers](https://developer.twitter.com/en)

### ** Refer the project report for detailed log in information to extract data from twitter ** 

## PACKAGES
1.	**twitteR** - The twitteR package is intended to provide access to the Twitter API within R, allowing users to grab interesting subsets of Twitter data for their analyses. Provides an interface to the Twitter web API.
2.	**Plyr** - The plyr package is a set of clean and consistent tools that implement the split-apply-combine pattern in R. This is an extremely common pattern in data analysis: you solve a complex problem by breaking it down into small pieces, doing something to each piece and then combining the results back together again.
3.	**ROAuth** - The OAuth class is currently implemented as a reference class. An instance of a generator for this class is provided as a convenience to the user as it is configured to handle most standard cases. To access this generator, use the object OAuthFactory. 
4.	**Stringr** - A consistent, simple and easy to use set of wrappers around the fantastic 'stringi' package. All function and argument names (and positions) are consistent, all functions deal with "NA"'s and zero length vectors in the same way, and the output from one function is easy to feed into the input of another. 	
5.	**ggplot2** - A system for 'declaratively' creating graphics, based on "The Grammar of Graphics". You provide the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.
6.	**e1071** - The package e1071 oﬀers an interface to the 
    a.	C- and ν-classiﬁcation
    b.	one-class-classiﬁcation (novelty detection)
    c.	ν-regression
and includes:
    a.	linear, polynomial, radial basis function, and sigmoidal kernels
    b.	formula interface
    c.	k-fold cross validation

7.	**tm** - This vignette gives a short introduction to text mining in R utilizing the text mining framework provided by the tm package. We present methods for data import, corpus handling, preprocessing, metadata management, and creation of term-document matrices.
8.	**dplyr** - It provides a flexible grammar of data manipulation. It's the next iteration of plyr, focused on tools for working with data frames (hence the d in the name).
9.	**caret** - The caret package (short for Classification And REgression Training) contains functions to streamline the model training process for complex regression and classification problems. The package utilizes a number of R packages but tries not to load them all at package start-up (by removing formal package dependencies, the package startup time can be greatly decreased). The package “suggests” field includes 30 packages. caret loads packages as needed and assumes that they are installed.

## FILES
.CSV files for positive, negative and neutral words.


# SOLUTION STATEMENT

## SENTIMENT ANALYSIS
Sentiment analysis refers to the use of natural language processing, text analysis, computational linguistics, and biometrics to systematically identify, extract, quantify, and study affective states and subjective information. Sentiment analysis is widely applied to voice of the customer materials such as reviews and survey responses, online and social media, and healthcare materials for applications that range from marketing to customer service to clinical medicine.
The rise of social media such as blogs and social networks has fueled interest in sentiment analysis. With the proliferation of reviews, ratings, recommendations and other forms of online expression, online opinion has turned into a kind of virtual currency for businesses looking to market their products, identify new opportunities and manage their reputations. As businesses look to automate the process of filtering out the noise, understanding the conversations, identifying the relevant content and actioning it appropriately, many are now looking to the field of sentiment analysis. If web 2.0 was all about democratizing publishing, then the next stage of the web may well be based on democratizing data mining of all the content that is getting published. 

Even though short text strings might be a problem, sentiment analysis within microblogging has shown that Twitter can be seen as a valid online indicator of e-commerce sentiment. Tweets' e-commerce sentiment demonstrates close correspondence to products indicating that the content of Twitter messages plausibly reflects the other (e-commerce websites like Amazon, Flipkart and Myntra).
 
## NAÏVE BAYES CLASSIFICATION
Naive Bayes is a Supervised Machine Learning algorithm based on the Bayes Theorem that is used to solve classification problems by following a probabilistic approach. It is based on the idea that the predictor variables in a Machine Learning model are independent of each other. Meaning that the outcome of a model depends on a set of independent variables that have nothing to do with each other. 

Here, we are building a Naïve Bayes model in order to classify future tweets by training the model to analyze the previously extracted data. The algorithm makes a very strong assumption about the data having features independent of each other while in reality, they may be dependent in some way. In other words, it assumes that the presence of one feature in a class is completely unrelated to the presence of all other features. If this assumption of independence holds, Naive Bayes performs extremely well and often better than other models. Naive Bayes can also be used with continuous features but is more suited to categorical variables. If all the input features are categorical, Naive Bayes is recommended. However, in case of numeric features, it makes another strong assumption which is that the numerical variable is normally distributed.





















