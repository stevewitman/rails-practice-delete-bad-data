# Rails Practice - Delete Bad Data

## Setup

* `bundle`
* `rake db:create db:migrate db:seed`
* `rails s`

## Oh No!

Your developers forgot to put `dependent: :destroy` on Person and Location,
so now there are a bunch of assignments that are not connected to
a person or a location.

Your mission, should you choose to accept it, is to delete all the data from
Assignments where either the location_id is not in the list of Location ids,
OR the person_id is not in the list of valid Person ids.

Use a rake task to accomplish this.
