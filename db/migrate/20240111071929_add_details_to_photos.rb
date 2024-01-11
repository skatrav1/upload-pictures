# frozen_string_literal: true

class AddDetailsToPhotos < ActiveRecord::Migration[7.1]
  def change
    add_column :photos, :title, :string
    add_column :photos, :description, :text
  end
end
