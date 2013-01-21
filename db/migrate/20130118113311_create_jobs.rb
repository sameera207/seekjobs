class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :city
      t.references :category
      t.date :posted_date
      t.string :advert_link
      t.float :pay_low
      t.float :pay_heigh
      t.string :seek_id
      t.timestamps
    end
  end
end
