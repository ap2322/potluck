class Potluck
  attr_reader :date, :dishes

  def initialize(date, dishes = [])
    @date = date
    @dishes = dishes
    @menu = {
      appetizer: [],
      entre: [],
      dessert: [],
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

  def get_names_in_cat(category)
    get_all_from_category(category).map do |dish|
      dish.name
    end
  end

  def menu
    # self.add_appetizers_to_menu
    # self.add_entrees_to_menu
    # self.add_desserts_to_menu
    add_dishes_to_menu
    @menu
  end

  def all_categories_of_dishes
    categories = @dishes.map do |dish|
      dish.category
    end
    categories.uniq
  end

  def add_dishes_to_menu
    # binding.pry
      @menu.each do |menu_category, value|
        value << get_names_in_cat(menu_category)
        value.flatten!
      end
  end

  # def add_appetizers_to_menu
  #   @menu[:appetizers] = get_all_from_category(:appetizer).map do |dish|
  #     dish.name
  #   end
  #   @menu[:appetizers] = @menu[:appetizers].sort
  # end
  #
  # def add_entrees_to_menu
  #   @menu[:entrees] = get_all_from_category(:entre).map do |dish|
  #     dish.name
  #   end
  #   @menu[:entrees] = @menu[:entrees].sort
  # end
  #
  # def add_desserts_to_menu
  #   @menu[:desserts] = get_all_from_category(:dessert).map do |dish|
  #     dish.name
  #   end
  #   @menu[:desserts] = @menu[:desserts].sort
  # end
end
