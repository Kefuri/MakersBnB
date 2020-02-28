# Makersbnb

Makers Group Project (Week 6) - buiding an Airbnb clone.

## Specifications

Specifications and wireframe mockup provided [here](https://github.com/makersacademy/course/blob/master/makersbnb/specification_and_mockups.md "Makersbnb specifications").


## User Stories

The following user stories were created from the specifications and test driven into creation. 

```
As a user,
so I can list a space,
I want to sign up with an email and a password.

As a signed-up user, 
so I can list a space or book a space,
I want to be able to sign in.

As a signed-in user,
so I can appeal to my customers,
I want to list a space.

As a user with a listed space,
so I can have a portfolio,
I want to be able to list multiple spaces.

As a user with a listed space,
so I can make my listings more specific,
I want to be able to add a short description and price per night.

As a user, 
so I can choose where I want to stay,
I want to see a list of all available spaces.

As a user,
so I can see more details on a space,
I want to see a spaces’ details.

As a user, 
so I can manage my spaces,
I want to see a list of all my spaces.

As a user, 
so that I can log out, 
I want to have a log-out button that will do so.

As a user, 
so that I can’t do illegal things, 
I want to only be able to visit functional pages if i'm logged in.

As a user who wants to book,
so that I can have a fantastic night away,
I want to be able to book a space for one day.

As a user who wants to book,
so I can’t book a space which is unavailable,
I want to only be able to book spaces for dates which are not already booked.

As a user with a listing,
so that I don’t try to fit too many people on my property,
I want only allow people to book specified days.

As a user looking to book, 
so that I can proceed with the booking, 
I want to be able to submit a booking request.

As a user who has made a booking, 
so that I can keep track of what I’ve done, 
I want to see what bookings I’ve requested. 

```

## Tech Stack

Front-end:
- HTML & CSS

Back-end:
- Ruby
- Sinatra
- PostgreSQL
- ActiveRecord

Testing:
- RSpec
- SimpleCov

## Databases

![Database stucture](./reference/database_structure.jpg)

To set up the databases, run the following commands in terminal:

```
rake build_db
RACK_ENV='test' rake build_db
RACK_ENV='production' rake build_db
```
This will also seed the databases with some test data (for viewing and using the site).