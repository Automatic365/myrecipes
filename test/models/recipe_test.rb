require 'test_helper'
require 'minitest/pride'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = Recipe.new(name: "Soup", description: "Tomato")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "description should not be less than 5 characters" do
    @recipe.description = "aaa"
    assert_not @recipe.valid?
  end

  test "description should not be more than 100 characters" do
    @recipe.description = "aa" * 101
    assert_not @recipe.valid?
  end

end
