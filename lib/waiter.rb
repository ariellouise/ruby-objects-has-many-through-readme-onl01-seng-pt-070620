class Waiter
  attr_accessor :name, :years_experience 
  @@all = []
  
  def initialize(name, yrs_experience)
    @name = name 
    @yrs_experience = yrs_experience 
    @@all << self 
  end
  
  def self.all 
    @@all 
  end 
  
  def meals
    Meal.all.select do |meal|
      meal.waiter == self 
    end 
  end 
  
  def best_tipper 
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip #compare 
    end 
    best_tipped_meal.customer 
  end 

end