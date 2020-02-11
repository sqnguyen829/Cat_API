#creates the structure of the users db table
#for more detail on this file type go to the cat migration file
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
    end
  end
end
