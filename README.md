# EliFUT Rails API service

Check the [Medium post](https://medium.com/@felipecsl/creating-an-android-app-for-beginners-part-i-410a7a64d9b1) for more information about it.

Official website: [elifut.com](http://elifut.com).

## Setup:

* Ruby version: 2.3.1
* System dependencies: Postgres


## Configuration

* Database initialization:

Set an environment variable called `ELIFUT_DATA_DIRECTORY` pointing to your local clone of the `EliFUT/data` repository.

Run:
```
rake db:create db:migrate import_metadata assign_relationships import_players_db assign_nations
```

* How to run the test suite: `rake spec`

* Services (job queues, cache servers, search engines, etc.): None yet

* Deployment instructions: `git push heroku master`
