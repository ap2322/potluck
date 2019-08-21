class Potluck
  attr_reader :date, :dishes

  def initialize(date, dishes = [])
    @date = date
    @dishes = dishes
    @menu = {
      appetizers: [],
      entrees: [],
      desserts: [],
    }
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  def menu
    self.add_appetizers_to_menu
    self.add_entrees_to_menu
    @menu
  end

  def add_appetizers_to_menu
    @menu[:appetizers] = get_all_from_category(:appetizer).map do |dish|
      dish.name
    end
    @menu[:appetizers] = @menu[:appetizers].sort
  end

  def add_entrees_to_menu
    @menu[:entrees] = get_all_from_category(:entre).map do |dish|
      dish.name
    end
    @menu[:entrees] = @menu[:entrees].sort
  end

  def add_desserts_to_menu
    @menu[:desserts] = get_all_from_category(:dessert).map do |dish|
      dish.name
    end
    @menu[:desserts] = @menu[:desserts].sort
  end
end
