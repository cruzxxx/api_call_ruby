# Rails practice

Learning how to make an API call that is secured by means of a JWT Authorization header with Rails.

### Calling API from the Controller vs db:seed
Apparently, APIs can be called from the controller or the seeds file in the db directory. This app makes a POST request with the credentials in the payload body and the response returns an access token. This token is then used to make a GET request to the URL to get the data to display on the frontend. The call is made from the controller as there is no need to populate the database with the data. 

If the data was to be stored in the DB, I could call the APIs from the seeds.rb file and then populate db using a model.

### Debugging
- Install the gems `pry` or `byebug` in the Gemfile, run bundle update.  
- Reference `byebug` or `binding.pry` anywhere in the model, controller or view. It should work on all of them but I'm getting a segfault error using binding.pry in the controller.

```
    group :development do
      gem 'pry'
    end
```
```
    group :development, :test do
      gem 'pry'
    end
```


### Commands

- Run server `rails server`
- Run seeds `rails db:seed`
