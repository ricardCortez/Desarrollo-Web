class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :resolucion
      t.text :observacion
      t.integer :doc_id
      t.integer :user_id

      t.timestamps
    end
  end
end
