# Makersbnb

Makers Group Project (Week 6) - buiding an Airbnb clone.


## Specifications

Specifications and wireframe mockup provided [here](https://github.com/makersacademy/course/blob/master/makersbnb/specification_and_mockups.md "Makersbnb specifications").


## User Stories

```
As a user 
So I can list a space
I want to sign up with an email, password

As a signed up user 
Sop I can list a space as my own
I want to sign in

As a signed in user 
So I can appeal to my customers 
I want to list a space

As a user with a listed space
So I can have a portfolio
I want to be able to list multiple spaces

As a user with a listed space
So I can make my listings more specific 
I want to be able to add a short description and price per night

As a user who wants to book
So that I can have a fantastic trip
I want to be able to book a space for a day.

As a user who wants to book
So I can’t be double booked
I want to only be able to book dates for locations that have no bookings

As a user with a listing 
So that I don’t try to fit too many people on my property
I want only allow people to book specified days/

As a user who wants to book,
So I can abide by a listing’s specified dates,
I want to only be able to book between a listing’s available days
```


## Tech Stack

Front-end:
- 

Back-end:
- Sinatra
- 

Testing:
- Rubocop


## Database

![Database stucture](./reference/database_structure.jpg)

Database setup:

```
rake db:create:all
rake db:migrate
RACK_ENV=production rake db:migrate
RACK_ENV=test rake db:migrate
```
