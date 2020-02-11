#creates the structure of the collections db table
#for more detail on this file type go to the cat migration file
class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :name
      t.integer :user_id
      t.integer :cat_id
    end
  end
end
