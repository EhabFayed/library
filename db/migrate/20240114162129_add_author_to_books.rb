class AddAuthorToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author, :string
    add_column :books, :created_at, :datetime
    add_column :books, :updated_at, :datetime

  end
end
