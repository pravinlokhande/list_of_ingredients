# README

* Used Technologies:
```
Ruby version: 2.6.3
Rails version: 6.0.0.rc1
```

* Start new project with Rails 
```
rails new administrator_app --database=postgresql
```

* Step to install active admin
First, you’ll need to swap your app/controllers/application_controller.rb from using the API to using Base, being sure to add in protect_from_forgery with: :exception.
So your application_controller.rb should go from looking like this:
```
class ApplicationController < ActionController::API
end
```
To something more like this:

```
class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
end
```

Now you can get any new controllers you make to inherit from ApiController, not ApplicationController. 
example, if you were making an UserController, it might look like this:
```
class UserController < ApiController
end
```
Now, in your config/application.rb add these to the Application class:
```
# Middleware for ActiveAdmin
config.middleware.use Rack::MethodOverride
config.middleware.use ActionDispatch::Flash
config.middleware.use ActionDispatch::Cookies
config.middleware.use ActionDispatch::Session::CookieStore
```
And, also add: ``require "sprockets/railtie"`` in the same file.

* Next up, your Gemfile. You’ll need to add the ActiveAdmin gems in:
```
# ActiveAdmin
gem 'devise'
gem 'activeadmin'
```

Bundle install everything, and then install ActiveAdmin into your Rails app:

```
bundle
bin/rails g active_admin:install
```

You should see something like the following:
```
Running via Spring preloader in process 57692
      invoke  devise
    generate    devise:install
      create    config/initializers/devise.rb
      create    config/locales/devise.en.yml
  ===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

===============================================================================
      invoke    active_record
      create      db/migrate/20180501170855_devise_create_admin_users.rb
      create      app/models/admin_user.rb
      invoke      test_unit
      create        test/models/admin_user_test.rb
      create        test/fixtures/admin_users.yml
      insert      app/models/admin_user.rb
       route    devise_for :admin_users
        gsub    app/models/admin_user.rb
        gsub    config/routes.rb
      append    db/seeds.rb
      create  config/initializers/active_admin.rb
      create  app/admin
      create  app/admin/dashboard.rb
      create  app/admin/admin_users.rb
      insert  config/routes.rb
    generate  active_admin:assets
Running via Spring preloader in process 57711
      create  app/assets/javascripts/active_admin.js
      create  app/assets/stylesheets/active_admin.scss
      create  db/migrate/20180501170858_create_active_admin_comments.rb
```

* Finally, migrate and seed the database:
```
rails db:migrate db:seed
```
* Once again you can fire up Rails:
```
bin/rails s -p 3001
```
# Run this app locally
* Procfile will automatically call using following command.
```
rake start
```