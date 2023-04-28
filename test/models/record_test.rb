require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  user = User.first

  test 'should not create a record when user is not exist' do
    record = Record.new(clock_in: DateTime.now)
    assert_not record.save, 'failed create record without user'
  end

  test 'should provide clock_in when create a record' do
    record = Record.new(user_id: user.id, clock_in: DateTime.now)
    assert record.save, 'success create record with clock_in'
  end

  test 'should not create record when clock_in is not present' do
    record = Record.new(user_id: user.id)
    assert_not record.save, 'failed create record without clock_in'
  end

  test 'should create record when clock_out greater than or equal clock_in' do
    record = Record.new(user_id: user.id, clock_in: DateTime.now, clock_out: DateTime.now + 8.hours, complete: true)
    assert record.save, 'success create record with clock_out'
  end

  test 'should not create record when clock_out less than clock_in' do
    record = Record.new(user_id: user.id, clock_in: DateTime.now, clock_out: DateTime.now - 8.hours)
    assert_not record.save, 'failed create record with clock_out less than clock_in'
  end

  test 'should not create record when clock_out provide but complete is false' do
    record = Record.new(user_id: user.id, clock_in: DateTime.now, clock_out: DateTime.now + 8.hours, complete: false)
    assert_not record.save, 'faile create record with invalid complete'
  end
end
