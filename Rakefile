# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Import all data"
task :import_all => [:environment,
  :import_metadata,
  :assign_relationships,
  :import_players_db,
  :assign_nations]