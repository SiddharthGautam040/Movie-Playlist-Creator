# Movie Playlist Creator

Simple movie playlist creator application in which a user who has signed up can create a playlist and can search a movie and add that movie to a playlist.

## Installation

Follow these easy steps to install and start the app:

### Set up Rails app

First, clone the repo

Next, install the gems required by the application:

    bundle install

Next, execute the database migrations/schema setup:

	rails db:migrate

We have used API(https://www.omdbapi.com/) for searching a movie.


### Start the app

Before statting the application try running unit tests

    rails test
    
If tests runned without any failure start the Rails app to see the movie playlist creator application. You're ready to localize your app:

    rails server

You can find your app now by pointing your browser to [http://localhost:3000](http://localhost:3000). If everything worked you can sign up into Movie Playlist Creator

## Little about using the application

As soon as you sign-up or login in the application you will be redirected to search page of the application where you can search a movie or series avaliable in database and add that movie/series to your own created playlist. You can create a playlist, delete a playlist or remove specific item from playlist all of these actions are only allowed to logged in user.

### This applicaiton is also Hosted on Heroku 

https://fasal-assignment-siddharth.herokuapp.com/

You can directly login with demo user details

	email: 	  user@sample.com
	password: demouser


## More information

* We are not a patron of (https://www.omdbapi.com/) so we request you to not do more than 1000 search requests of a day.
* Some of the movies did not have any poster so we have used a default poster for them
* Some times API is pretty busy and do not respond but we have taken care of that.

## Get help / support

Ran into trouble please contact [siddharthgautam040@gmail.com] and we can take more direct action toward finding a solution.

