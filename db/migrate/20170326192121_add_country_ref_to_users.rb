class AddCountryRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :country, foreign_key: true
  end
end
