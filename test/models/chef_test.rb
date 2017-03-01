require 'test_helper'
require 'minitest/pride'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Jason", email: "Tomato@gmail.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "name should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end

  test "email should not be less than 5 characters" do
    @chef.email = "aaa"
    assert_not @chef.valid?
  end

  test "email should not be more than 100 characters" do
    @chef.email = "aa" * 101
    assert_not @chef.valid?
  end

  test "email should be lower case before hitting db" do
    mixed_email = "JohN@ExampLe.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end

end
