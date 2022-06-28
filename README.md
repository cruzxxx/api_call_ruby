# Rails practice

Learning how to make an API call that is secured by means of a JWT Authorization header with Rails.

### Calling API from the Controller vs db:seed
This app posts the credentials to get an access token and then uses the token to get the data to display on the frontend. The call is made from the controller as there is no need to populate the database with the data. 

If the data was to be stored in the DB, I could make the API call from the seeds.rb file and then populate the model.

### Debugging
- Install the gems `pry` or `byebug` in the Gemfile then run bundle update.  

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

- Reference `byebug` or `binding.pry` anywhere in the model, controller or view. It should work on all of them but I'm getting a segfault error using binding.pry in the controller.

### Commands

- Run server `rails server`
- Run seeds `rails db:seed`
