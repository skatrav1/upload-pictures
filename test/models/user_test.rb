# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
  end

  test 'should create valid user' do
    assert @user.valid?
  end

  test 'should authenticate user with valid credentials' do
    @user.save
    assert User.find_for_authentication(email: @user.email).valid_password?('password123')
  end

  test 'admin? should return false for non-admin user' do
    @user.admin = false
    assert_not @user.admin?
  end

  test 'admin? should return true for admin user' do
    @user.admin = true
    assert @user.admin?
  end
end