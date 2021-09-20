class CreateOpcoes < ActiveRecord::Migration[6.1]
  def change
    create_table :opcoes do |t|
      t.belongs_to :enquete, null: false, foreign_key: true
      t.boolean :ativa, null: false, default: true
      t.string :nome, null: false
      t.text :descricao

      t.timestamps
    end
  end
end
