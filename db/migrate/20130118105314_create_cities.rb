class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
    end
    cities = %w{Sydney Melbourne Brisbane Perth Not-Specified}
    cities.each do |city|
      City.create(:name => city)
    end
  end
end
