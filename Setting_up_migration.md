First lets bundle install the gems we need, makes sure to add gem we might use. To add gems after bundle install just delete the Gemfile.lock and bundle install again.



To create new migration tables 
- rake db:create_migration NAME=[create_'class name pluralized']

Set up the relationship for the models


Migrate the tables now
- rake db:migrate


Seed the tables with data to test
- rake db:seed

That's for setting up the migration.

Issues students face during these set up.
-bundle installing the right gems, and having the right version number. Mainly 5.2 active record in the migration table
-setting up the models properly
-If they pushed to github and they don't see the sqlite file, this is due to the file cant be uploaded to github so the over partner just need to seed the file again.
-bundle install issue where a student miss type a gem name and bundle installed. migration and seed work but during each process error messages would come up. to fix bundle installation run [ bundle clean --force ]   https://bundler.io/man/bundle-clean.1.html 
