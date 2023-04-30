require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  test 'should response success to create a record' do
    post records_url, headers: { 'Authorization': build_jwt }
    assert_response :success
  end
end
