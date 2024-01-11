# frozen_string_literal: true

class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_create :set_random_id
  validates :title, :description, presence: true

  private

  def set_random_id
    self.random_id = SecureRandom.hex(10) unless random_id.present?
  end
end
