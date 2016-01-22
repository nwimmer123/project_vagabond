class AddCoordinatesToCities < ActiveRecord::Migration
  def change
    add_column :cities, :coordinates, :string
  end
end
