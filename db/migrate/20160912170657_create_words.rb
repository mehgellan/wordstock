class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :term
      t.string :pos
      t.string :definition
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
