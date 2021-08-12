# James Horan CBA Transaction Exercise

James Horan - November 2017

## About the app
iPhone/iPad app providing details of a single bank account and a list of different transaction types ordered by date.

## General thoughts and approach
+ I’m not overly familiar with the banking domain and made a few assumptions around naming components. I would normally consult a domain expert within the organisation if I didn’t have the domain knowledge needed.
+ I decided to use the new Decodable protocol instead of a custom JSON parser to convert the JSON objects into equivalent Structs.
+ Decodable requires a lot less code than a custom JSON parser and the few limitations of the new protocol have been considered and don't affect the requirements of this exercise.
+ I created a basic service to load the JSON file and action decoding the data to the AccountDetails struct.
+ I created an AccountDetailsViewData struct which is almost like a ViewModel. The AccountDetailsViewData has the required data for the TableViewController and also performs any sorting, merging and grouping of transactions.
+ I would consider creating a protocol of what the TableViewController requires and have both a mocked (with a bunch of static data) and non-mocked ViewData objects that would both conform to a ProvidesAccountDetailsViewData protocol.
+ All the view based logic is performed within the View layers rather than the ViewControllers.
+ I wanted to make sure the functions and logic to manipulate view data and to fetch decoded data were seperate.
+ Because the exercise is a single page VC using storyboards, I set the AccountDetailsViewData to be initialised along with the AccountDetailsService within the TableViewController. In a larger scale project I would consider other options and prefer to inject the loaded view data into the TableViewController from some other object and responsibility.
+ With more time I would make an AccountDetailsService to load data from a network. In this implementation of an AccountDetailsService I would consider passing back a result type and encapsulate the AccountDetails in a successful result.

## Build Requirements
+ Xcode 9.0 or later
+ iOS 11.0 SDK or later
+ Swift 4.0

## Runtime Requirements
+ iOS 9.0 or later

## Setup
There are no third party dependencies or steps required to setup the project.
Opening the project and building should be enough to run the app.
