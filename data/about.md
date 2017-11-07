# Johns Hopkins / Coursera Data Science Capstone Project
### Mike Keyes
### November 2017
*****
### Course Background

This is the final project for the Johns Hopkins Data Science Specialization on Coursera. Tthe specialization is a 10 course online program that covers various topics in data science, statistics and machine learning. More information can be found here: https://www.coursera.org/specializations/jhu-data-science

### Project Background

The task for the project was to construct a Shiny appication which would predict the next word when given text input, similar to the auto-correct functions on a phone. As input a 500 MB corpus of twitter posts, news articles and blog posts was provided. Size and speed both needed to be considered since an application like this needs to be repsonsive and probably needs to run on a limited environment like a phone. 

*****

## Data Manipulation and Model Creation

After exploring the corpus, the text was cleaned (symbols, punctuation and white space was removed and everything was transformed to lower case) and tokenized into 2, 3, 4, and 5-grams. These n-grams were then aggregated by the first n-1 words. The 3, 4 and 5-grams with a frequency of 1 were truncated to reduce file size and improve performance. Finally the data sets were truncated to keep a maximum of 3 examples of the n-1 grams. 

The application uses a back-off model which first checks the higher n data set for matches with the entered text. If matches are not found it moves on to lower n data sets. If no match is found by the time it gets to the 2-gram it discards the last word of the entered text and performs the same analysis on the previous word. Up to three matches are returned ordered by their frequency in the corpus. 

*****
## Using the Applicaiton

The application can be found here: https://mikekeyes.shinyapps.io/capstone_project/ . It is very straightforward to use, simply type text in the box and the next word suggestions will appear to the right. 

![Application Screenshot](https://github.com/mikekeyes/coursera_capstone/screenshot.png "Application Screenshot")



*****

## Additional Informaiton

 - The Shiny applicaiton can be found here: https://mikekeyes.shinyapps.io/capstone_project/
 - The code used for this application can be found on GitHub here: 
 