class CreateBookMarks < ActiveRecord::Migration
  def change
    create_table :book_marks do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :body
    end
  end
end
