require 'test_helper'
require 'minitest/pride'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "jason", email: "jason@example.com")
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
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
    assert @recipe.valid?
  end

  test "description should not be more than 100 characters" do
    @recipe.description = "aa" * 501
    assert @recipe.valid?
  end

end
