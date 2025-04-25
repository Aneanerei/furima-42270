class CreateOrderShippings < ActiveRecord::Migration[7.1]
  def change
    create_table :order_shippings do |t|

      t.timestamps
    end
  end
end
