require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test

  def setup
    @potluck = Potluck.new("7-13-18")
  end

  def add_dishes_to_setup
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
  end

  def test_it_exists
    assert_instance_of Potluck, @potluck
  end

  def test_initial_attributes
    assert_equal "7-13-18", @potluck.date
    assert_equal [], @potluck.dishes
  end

  def test_add_dish
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @potluck.add_dish(couscous_salad)
    @potluck.add_dish(cocktail_meatballs)

    assert_equal [couscous_salad, cocktail_meatballs], @potluck.dishes
    assert_equal 2, @potluck.dishes.length
  end

  def test_get_dish_from_category
    add_dishes_to_setup

    assert_equal [@couscous_salad, @summer_pizza], @potluck.get_all_from_category(:appetizer)
    assert_equal @couscous_salad, @potluck.get_all_from_category(:appetizer).first
    assert_equal "Couscous Salad", @potluck.get_all_from_category(:appetizer).first.name
  end

  def test_menu
    add_dishes_to_setup
    bean_dip = Dish.new("Bean Dip", :appetizer)
    @potluck.add_dish(bean_dip)

    assert_instance_of Hash, @potluck.menu
    assert_equal [:appetizers, :entrees, :desserts], @potluck.menu.keys
    assert_equal ["Bean Dip", "Couscous Salad", "Summer Pizza"], @potluck.menu[:appetizers]
    assert_equal ["Cocktail Meatballs", "Roast Pork"], @potluck.menu[:entrees]

  end

  def test_add_dishes_to_menu_helper_function
    add_dishes_to_setup

    assert_equal [@couscous_salad, @summer_pizza], @potluck.menu[:appetizers]
  end

  def test_unique_categories_array
    add_dishes_to_setup

    assert_equal [:appetizer, :entre, :dessert], @potluck.all_categories_of_dishes
  end
end
