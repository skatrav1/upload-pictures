require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin_user = users(:one)    
    @non_admin_user = users(:two) 
    sign_in @admin_user          
  end
  
  test 'should update user' do
    patch user_url(@non_admin_user), params: { user: { email: 'email@xyz.com' } }
    assert_redirected_to user_url(@non_admin_user)
    @non_admin_user.reload
    assert_equal 'email@xyz.com', @non_admin_user.email
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@non_admin_user)
    end
    assert_redirected_to root_url
  end

  test 'non-admin should not destroy user' do
    sign_in @non_admin_user
    assert_no_difference('User.count') do
      delete user_url(@non_admin_user)
    end
    assert_redirected_to root_url
  end

  test 'unauthenticated access should be redirected' do
    sign_out @admin_user
    get user_url(@non_admin_user)
    assert_redirected_to new_user_session_url
  end
end
