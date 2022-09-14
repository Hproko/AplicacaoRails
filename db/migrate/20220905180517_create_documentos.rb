class CreateDocumentos < ActiveRecord::Migration[7.0]
  def change
    create_table :documentos do |t|
      t.string :rg
      t.string :cpf
      t.references :pessoa, foreign_key: true

      t.timestamps
    end
  end
end
