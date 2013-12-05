class AddTipoContribuyenteIdToClient < ActiveRecord::Migration
  def change
    add_column :clients, :tipo_contribuyente_id, :integer
  end
end
