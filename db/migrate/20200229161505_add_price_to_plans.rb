class AddPriceToPlans < ActiveRecord::Migration[5.2]
  def change
    add_monetize :plans, :price, currency: { present: false }
  end
end
