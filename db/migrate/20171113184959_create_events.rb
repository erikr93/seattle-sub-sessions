class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :lineup
      t.string :date
      t.string :time
      t.string :location
      t.string :cover
      t.string :age
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
