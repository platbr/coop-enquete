class CreateVotos < ActiveRecord::Migration[6.1]
  def change
    create_table :votos do |t|
      t.belongs_to :usuario, null: false, foreign_key: true
      t.belongs_to :enquete, null: false, foreign_key: true
      t.belongs_to :opcao, null: true, foreign_key: true
      t.string :conteudo
      t.text :justificativa
      t.string :ip

      t.timestamps
    end
  end
end
