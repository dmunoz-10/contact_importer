# Contact Importer
Contact importer is an app to import contacts... Didn't you see that coming, eh? ;) <br>
Heroku deploy: https://contact-importer-dmunoz.herokuapp.com/

## How to run the app

 1. Install the specified ruby version (2.7.3).
 2. Install Redis and Postgresql.
 3. Run `bundle install` to install all the ruby dependencies.
 4. Run `yarn install` to install all the node dependencies.
 5. Run `rails db:create` to create the databases.
 6. Run `rails db:migrate` to run the migrations to create the tables.
 7. Run `bundle exec sidekiq` to execute sidekiq.
 8. Run `bundle exec rails server` to finally execute the app.
 9. (Optional) Instead of do the step 7 and 8, you can install foreman (`gem install foreman`) and run `foreman start -f Procfile.dev` and it will handle the execution for you.

## Credentials
Email: test@test.com <br>
Password: testing

## CSV Files
There are 4 csv files on `spec/fixtures/files/csv/` for each condition.

 - data_example.csv: all contacts are allowed to be created.
 - data_example_2.csv: some contacts are allowed to be created and some aren't.
 - data_example_3.csv: all contacts have errors.
 - data_example_4.csv: there are no contacts, it's empty.

## Test

To test the app just run the `rspec` command.
