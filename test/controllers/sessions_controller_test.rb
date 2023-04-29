require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create new session when name is valid' do
    post sessions_url, params: { user: { name: 'MyString' } }
    assert_response :success
  end

  test 'should not create new session when name is invalid' do
    post sessions_url, params: { user: { name: 'YourString' } }
    assert_response :not_found
  end
end
