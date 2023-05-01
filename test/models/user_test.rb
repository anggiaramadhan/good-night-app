require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should allow create new user with valid name' do
    user = User.new(name: 'Jane Doe')
    assert user.save, 'success create new user with valid name'
  end

  test 'should not allow create new user with empty name' do
    user = User.new(name: '')
    assert_not user.save, 'failed to create new user with empty name'
  end

  test 'should not allow create new user with name more than 50 chars' do
    user = User.new(name: 'A sessional instructor of Interaction Design at Emily Carr University of Art and Design')
    assert_not user.save, 'failed to create new user with more than 50 chars name'
  end

  test 'should create a clock_in record' do
    user = User.first
    assert user.clock_in, 'success clock_in and create new record'
  end

  test 'should create a clock_out record' do
    user = User.first
    assert user.clock_out, 'success clock_out and update uncomplete record'
  end
end
