#this file will create the structure of the cats db table
#CreateCats class is inhereting from ActiveRecord::Migration version 5.2 since during the time of this app creation that was the most stable version
class CreateCats < ActiveRecord::Migration[5.2]
  #the method change is being called by rake db:migrate to look for the create_table in the method change
  def change
    #there could be multiple create_table in this change method, but thats not recommended since when we learn rails later, it will make seperate files for us for each table
    create_table :cats do |t|
      t.string :name
      t.string :bio
      t.string :origin
      t.integer :friendly
    end
  end
end
