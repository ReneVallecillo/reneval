class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :fullname
      t.string :ruc, :limit => 14
      t.string :legalrepresentative
      t.string :address
      t.string :web

      t.timestamps
    end
  end
end
