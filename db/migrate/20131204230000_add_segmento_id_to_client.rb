class AddSegmentoIdToClient < ActiveRecord::Migration
  def change
    add_column :clients, :segmento_id, :integer
  end
end
