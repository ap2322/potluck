class Potluck
  attr_reader :date, :dishes

  def initialize(date, dishes = [])
    @date = date
    @dishes = dishes
  end

  def add_dish(dish)
    @dishes << dish
  end 
end
