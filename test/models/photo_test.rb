require 'test_helper'
include ActionDispatch::TestProcess

class PhotoTest < ActiveSupport::TestCase
  test 'should have a valid title and description' do
    photo = Photo.new(title: 'My Photo', description: 'A great photo description')
    assert photo.valid?, 'Photo should be valid with a title and description'
  end

  test 'should require a title' do
    photo = Photo.new(title: 'Title1', description: 'A description')
    assert photo.valid?, 'Photo should be initially valid'

    photo.title = nil
    assert_not photo.valid?, 'Photo should be invalid without a description'
    assert_equal ["can't be blank"], photo.errors[:title]
  end

  test 'should require a description' do
    photo = Photo.new(title: 'My Photo', description: 'A description')
    assert photo.valid?, 'Photo should be initially valid'

    photo.description = nil
    assert_not photo.valid?, 'Photo should be invalid without a description'
    assert_equal ["can't be blank"], photo.errors[:description]
  end

  test 'should upload an image' do
    photo = Photo.new(title: 'My Photo', description: 'A description')
    photo.image = fixture_file_upload('image.jpg', 'image/jpeg')

    assert photo.valid?, 'Photo should be valid with an image'
    assert_not_nil photo.image, 'Photo should have an image attached'
  end

  test 'should generate a random id before create' do
    photo = Photo.create(title: 'My Photo', description: 'A description')
    assert_not_nil photo.random_id, 'Photo should have a random id'
  end

  test 'should not accept non-image file types' do
    photo = Photo.new(title: 'My Photo', description: 'A description')
    photo.image = fixture_file_upload('invalid.pdf', 'application/pdf')

    assert_not photo.valid?, 'Photo should not be valid with a non-image file'
  end

  test 'should not accept empty title or description' do
    photo = Photo.new(title: '', description: '')
    assert_not photo.valid?, 'Photo should not be valid with empty title and description'
  end
end
