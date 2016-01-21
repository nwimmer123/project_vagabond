class AddCityToEntries < ActiveRecord::Migration
  def change
    add_reference :entries, :city, index: true, foreign_key: true
  end
end
