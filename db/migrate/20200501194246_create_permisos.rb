class CreatePermisos < ActiveRecord::Migration[6.0]
  def change
    create_table :permisos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
