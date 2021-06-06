require "test_helper"

class UserTest < ActiveSupport::TestCase
 
  def setup
    @user = users(:one)
    @new_user = User.new(email:'email@email.com', password: '000001')
  end

  test "Valid user" do
    assert @user.valid?
  end

  test "Can't sign in without email" do
    @new_user.email = nil
    assert_not_nil @new_user.errors[:email]
  end


  test "Can't create account without email" do
    @new_user.email = nil
    assert_not_nil @new_user.errors[:email]
  end


  test "Can't create account without password" do
    @new_user.password = nil
    assert_not_nil @new_user.errors[:password]
  end

end
