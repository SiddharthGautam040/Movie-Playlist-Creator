class CreateListitems < ActiveRecord::Migration[7.0]
  def change
    create_table :listitems do |t|
      t.string :title
      t.string :year
      t.string :released
      t.string :runtime
      t.string :genere
      t.string :writer
      t.string :actors
      t.string :plot
      t.string :language
      t.string :awards
      t.string :poster
      t.string :imdb
      t.string :type
      t.string :total_seasons
      t.string :response
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
