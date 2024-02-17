class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.string :book_title
      t.string :book_author
      t.integer :rating
      t.date :read_date
      t.text :content
      t.string :book_image_url

      t.timestamps
    end
  end
end
