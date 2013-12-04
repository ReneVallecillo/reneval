class CreateTipoContribuyentes < ActiveRecord::Migration
  def change
    create_table :tipo_contribuyentes do |t|
      t.string :name

      t.timestamps
    end
  end
end
