class CreateTipodocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipodocumentos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
