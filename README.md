
## Gojimo Challenge

## Description

Develop a very simple working application on your chosen platform (Android / iOS / Web) with the
following functionality:

1. Read the following JSON feed containing a list of qualifications (a sample is presented below
for your reference): https://api.gojimo.net/api/v4/qualifications
2. Display a list of qualifications based on the data provided by the feed.
3. Allow users to click a qualification to be presented with a list of subjects for that qualification.

BONUS POINTS

Whilst not essential, we will be very pleased to see you take the challenge further by:

1. Using the data provided to its full potential by taking advantage of fields like colour for subjects.  
2. Making the GUI as appealing and responsive as possible.  
3. Storing the data locally and refresh from the server as requested, taking advantage of the
HTTP headers to avoid downloads of non-stale data.
4. Unit testing your code.  


## Approach to Testing & Development:

- Test Driven Development was used to build application.
- 100% Test Coverage  
[![Coverage Status](https://coveralls.io/repos/github/russellvaughan/gojimo-challenge/badge.svg?branch=master)](https://coveralls.io/github/russellvaughan/gojimo-challenge?branch=master)
- Factory Girl used to substitute fixtures.
- Webmock used to mock API requests
- Controllers, Models and Services all unit tested.
- Service created to fetch and store api data locally.
- Utilized data fields to display subjects by their given colour.
- Single Responsibilty Principle adhered to wherever possible.
- Deployed to Heroku
- Rake task created to call service (giving ability to use Heroku Scheduler.)

## Screenshots

![Image of Qualifications Page]
(http://i.imgur.com/uHy7zWb.png)

![Image of Subjects Page]
(http://i.imgur.com/dWML7Cq.png)

## Live Site

https://gojimo-challenge.herokuapp.com/

###Instructions

To deploy frontend

```
$ https://github.com/russellvaughan/gojimo-challenge
$ cd fairMuse/gojimo-challenge
$ bundle # Installs all backend dependencies
$ rake db:create
$ rake update_feed 
$ rails server # Runs the application locally
```

## Testing

To run all unit tests: 
```$ rspec```
