require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  test 'should response success to create a record' do
    post records_url, headers: { 'Authorization': build_jwt }
    assert_response :success
  end

  test 'should response success when update record' do
    user = User.find_by_name('MyString')
    record = user.records.first
    put record_url(record), headers: { 'Authorization': build_jwt }
    assert_response :success
  end
end
