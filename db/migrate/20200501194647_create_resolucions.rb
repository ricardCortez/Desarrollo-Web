class CreateResolucions < ActiveRecord::Migration[6.0]
  def change
    create_table :resolucions do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
