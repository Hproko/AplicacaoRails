class EsportesPessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :esportes_pessoas do |t|
      t.references :esporte
      t.references :pessoa

      t.timestamps
    end
  end
end
