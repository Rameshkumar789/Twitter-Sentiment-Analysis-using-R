# Twitter-Sentiment-Analysis-using-R
Twitter Sentiment Analysis using R
OVERVIEW
Tweets are imported using R and the data is cleaned by removing emoticons and URLs. Lexical Analysis is used to predict the sentiment of tweets and subsequently express the opinion graphically through ggplots, histogram, pie chart and tables.

SYSTEM REQUIREMENTS
● Installation of R 
● Twitter Authentication to access API  

FEATURES
1. Extraction of Tweets 
(i) Create twitter application  
(ii) twitteR - Provides an interface to the Twitter web API
(iii) ROAuth - R Interface For OAuth
(iv)Create twitter authenticated credential object, It is done using consumer key, consumer secret, access token, access secret.  
(v) During authentication, we are redirected  to a URL automatically where we click on Authorize app as shown in the image below and enter the unique 7-digit number to get linked to the account from which feeds are being taken.
2. Cleaning Tweets  
The tweets are cleaned in R by removing:
 ● Extra punctuation 
● Stop words (Most commonly used words in a language like the, is, at, which, and, on,.)
 ● Redundant Blank spaces
 ● Emoticons 
● URLS  
3. Loading Word Database  
A database, created by Hui Lui containing positive and negative words, is loaded into R. This is used for Lexical Analysis, where the words in the tweets are compared with the words in the database and the sentiment is predicted.  
For movie tweets, Naive Bayes Machine Learning Algorithm is used. AFINN is a list of English words rated for valence with an integer between minus five (negative) and plus five (positive). The words have been manually labeled by Finn Årup Nielsen in 2009-2011. The file is tab-separated. The version used is: AFINN-111: Newest version with 2477 words and phrases.
4. Algorithms used  
● Lexical Analysis: By comparing uni-grams to the pre-loaded word database, the tweet is assigned sentiment score - positive, negative or neutral and overall score is calculated.
5. Calculating percentage  
 I have presented the scores, the tweets as well as the percentage of positive/negative emotion in the text. This calculated using simple arithmetic to understand the overall sentiment in a more better manner
6. Histogram tab : histogram plot  
Histograms of positive, negative and overall score are found under the Histogram tab for graphically analyzing the intensity of emotion in the tweeters.

PACKAGES USED
● twitteR: Provides an interface to the Twitter web API 
● stringr: String operations in R 
● ROAuth: Provides an interface to the OAuth 1.0 specification allowing users to authenticate via OAuth to the server of their choice. 
● RCurl: Provides functions to allow one to compose general HTTP requests and provides convenient functions to fetch URIs, get & post forms, etc. and process the results returned by the Web server.  
● ggplot2: An implementation of the grammar of graphics in R. It combines the advantages of both base and lattice graphics: conditioning and shared axes are handled automatically, and you can still build up a plot step by step from multiple data sources. 
● reshape: Flexibly restructure and aggregate data using just two functions: melt and cast 
● tm : A framework for text mining applications within R. 
● RJSONIO: This is a package that allows conversion to and from data in Javascript object notation (JSON) format. This allows R objects to be inserted into Javascript code and allows R programmers to read and convert JSON content to R objects 
● plyr: Tools for Splitting, Applying and Combining Data

LIMITATIONS
 1. The Twitter Search API can get tweets upto a maximum of 7 days old.  
 2. Cannot get 100% efficiency in analysing sentiment of tweets. 

FUTURE WORK
•	Detect sarcasm in tweets 
•	Analyse images for emotions.  
•	Add Telugu  words to dataset.  
•	Find no of mentions of n particular organizations. 
•	Parallelizing code. 
•	Apply better Machine Learning Algorithms (Like Support Vector Machine).

REFERENCES
●   https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html
 ●   https://www.quora.com/How-can-I-read-Twitter-data-directly-in-R
●   https://www.r-bloggers.com/emoticons-decoder-for-social-media-sentimentanalysis-in-r/  
●   https://eight2late.wordpress.com/2015/11/06/a-gentle-introduction-to-naive-bayes-classification-using-r/
