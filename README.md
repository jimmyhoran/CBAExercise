# James Horan CBA Transaction Exercise

## About the app
iPhone/iPad app providing details of a single bank account and a list of different transaction types ordered by date.

## Thoughts and approach
+ I decided to use the new Decodable protocol instead of a custom JSON parser to convert the JSON objects into equivalent Structs.
+ Decodable requires a lot less code than a custom JSON parser and the few limitations of the new protocol have been considered and don't affect the requirements of this project.

## Build Requirements
+ Xcode 9.0 or later
+ iOS 11.0 SDK or later
+ Swift 4.0

## Runtime Requirements
+ iOS 9.0 or later

## Setup
There are no third party dependencies or steps required to setup the project.
Opening the project and building should be enough to run the app.
