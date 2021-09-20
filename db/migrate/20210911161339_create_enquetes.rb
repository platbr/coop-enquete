class CreateEnquetes < ActiveRecord::Migration[6.1]
  def change
    create_table :enquetes do |t|
      t.integer :tipo, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :qtd_votos, null: false, default: 1
      t.datetime :finaliza_em
      t.string :nome, null: false
      t.text :descricao

      t.timestamps
    end
  end
end
