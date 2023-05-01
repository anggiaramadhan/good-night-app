require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should follow another user' do
    target = User.first
    put follow_user_url(target), headers: { 'Authorization': build_jwt }
    assert_response :success
  end

  test 'should unfollow another user' do
    user = User.last
    target = User.first
    user.follow(target.id)

    put unfollow_user_url(target), headers: { 'Authorization': build_jwt }
    assert_response :success
  end

  test 'should fetch all friends records' do
    user = User.first
    User.last.follow(user.id)
    user.clock_in

    get friend_histories_url, headers: { 'Authorization': build_jwt }
    assert_response :success
  end
end
