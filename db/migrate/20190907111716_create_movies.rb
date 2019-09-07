class CreateMovies < ActiveRecord::Migration[5.2]
  def change
      create_table :movies do |t| 
        t.string :title 
        t.integer :integer
        t.string :director
        t.string :lead 
        t.boolean :in_theatres
        t.datetime :created
        t.datetime :updated
     end
    end
  end
