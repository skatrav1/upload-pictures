# frozen_string_literal: true

class AddRandomIdToPhotos < ActiveRecord::Migration[7.1]
  def change
    add_column :photos, :random_id, :string
  end
end
