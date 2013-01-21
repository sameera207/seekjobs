class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end
    categories = %w{Ruby Java PHP}
    categories.each do |cat|
      Category.create(:name => cat)
    end
  end
end
