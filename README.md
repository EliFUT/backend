# EliFUT Rails API service

Check the [Medium post](https://medium.com/@felipecsl/creating-an-android-app-for-beginners-part-i-410a7a64d9b1) for more information about it.

Hosted on [Heroku](http://elifut.herokuapp.com).

Setup:

* Ruby version: 2.2.2

* System dependencies: Postgres

* Configuration

* Database creation: `rake db:create`

* Database initialization:

Copy JSON dumps from the `EliFUT/data` repository into the `dumps` directory.

```
rake db:migrate
rake import_players
rake import_metadata
```

* How to run the test suite: `rake spec`

* Services (job queues, cache servers, search engines, etc.): None yet

* Deployment instructions: `git push heroku master`
