class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nome, null: false
      t.integer :tipo_documento, null: false
      t.string :documento, null: false
      t.boolean :ativo, null: false, default: true
      t.datetime :visto_em
      t.string :ultimo_ip

      t.timestamps
    end
  end
end
