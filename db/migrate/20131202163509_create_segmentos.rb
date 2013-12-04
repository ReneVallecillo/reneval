class CreateSegmentos < ActiveRecord::Migration
  def change
    create_table :segmentos do |t|
      t.string :name

      t.timestamps
    end
  end
end
