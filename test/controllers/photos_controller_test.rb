# frozen_string_literal: true
require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @photo = photos(:one)
  end

  test "should get index" do
    get photos_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_url
    assert_response :success
  end

  test "should create photo" do
    sign_in users(:one)
  
    photo_params = {
      title: 'My Photo',
      description: 'Test description',
      image: fixture_file_upload('image.jpg', 'image/jpeg')
    }
  
    assert_difference('Photo.count') do
      post photos_url, params: { photo: photo_params }
    end
  
    assert_redirected_to photo_url(Photo.last)
  end
  
  
  test "should show photo" do
    get photo_url(@photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_url(@photo)
    assert_response :success
  end

  test "should update photo" do
    patch photo_url(@photo), params: { photo: { title: 'Updated Photo' } }
    assert_redirected_to photo_url(@photo)
    @photo.reload
    assert_equal 'Updated Photo', @photo.title
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete photo_url(@photo)
    end

    assert_redirected_to photos_url
  end
end
