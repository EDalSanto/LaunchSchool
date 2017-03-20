### Todo web application created with Sinatra web framework. 

##### Organization and Structure
* Routes and how to handle requests to these routes, controllers in Rails, reside in todo.rb, along with basic helper methods and config.
* Views contains all the erb templates, like in rails.
* Public contains all assets you would expect: CSS, JS, and Images.
* Makes use of Adapter Design Pattern to implement data persistence with three
  possible mechanisms: Sessions, PG adapter gem, Sequel gem.
* The schemas for each table are included in raw SQL in scehma.sql

##### How To Run
* Install code locally and start up server with ``` bundle exec ruby todo.rb ```, and head on over to localhost:4567
