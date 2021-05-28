# ADIB-NYTimes-Articles
THE NYTimes Most Popular Articles Flow

##APP SETUP

Go to the project folder.
Open console and drag and drop “NYTimesMostPopularArticles” folder via this command e.g “cd /Users/farhankhan/Documents/ADIB/NYTimesMostPopularArticles”
Type pod install
A file “NYTimesMostPopularArticles.xcworkspace” will be created, please run the code via this file
Pod will be installed and you will able to run the App

##Dev Environment:
Pattern used: MVP
Min OS Supported : 11.0
Swift 5.0 
XCode Version 12.5

##Landing Page(NYTimesArticlesListViewController)


NYTimesArticlesListViewController.swift is main landing page controller with contains UI stuff related to most popular articles from the API
Empty view with message will be show to user if there is no internet connectivity
Data will be fetched from the server and will be shown on the screen with a search option
User can search the via multiple types e.g tile, author name, section
Data is presorted as per Publishing Date new -> old
When click on any article it will take you to article detailed screen
A third party library is being used for fetching remote images.

##Detailed Page(NYTimesArticleDetailViewController.swift)

NYTimesArticleDetailViewController.swift is detail page for an Article with more info to show
Error handling is being done properly as per data.
If any error comes UI will show a UI Error message
Share button is available to share the Article(if article has no share feature it will be hidden)
Read Full Article button also performs the same way and opens the Article in Safari. If link is broken Read Full Article button will be hidden

##Unit Testing
NYTimesMostPopularArticlesTests contains all the test cases with proper comments.
Supporting files folder has json files with dummy or test cases json data.
FILES can be found in Supporting Files -> Data Response JSON Model Folder

