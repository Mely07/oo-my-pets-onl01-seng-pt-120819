#An owner will know about its pet, be able to buy a pet, affect its mood by walking/feeding it, and sell a pet


class Owner
  attr_reader :name, :species 

  @@all = []
  
  def initialize(name)
    @name = name 
    @species = "human"
    save
  end
  
  def say_species
    return "I am a #{@species}." 
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|name| name.owner == self}
  end
  
  def dogs 
  # returns a collection of all the dogs that belong to the/a particular owner
    Dog.all.select {|name| name.owner == self}
  end

# When an owner buys a new pet, the `buy_cat/buy_dog` methods **take in an argument of a _name_.** You must take that name and do the following: - Make a new instance of the appropriate pet, initializing it with that name and the owner who is purchasing it_.
  
  def buy_cat(name)
  # Using name, make a new instance of the pet, initialize it with the name of owner who is purchasing it. Owner can buy a cat that is an instance of the Cat class. 
    
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end
  
  def walk_dogs
    #owner walks it dogs which makes the dogs' moods happy
    owners_dogs = self.dogs
    owners_dogs.map {|x| x.mood = "happy"}
  end 

  def feed_cats
    owners_cats= self.cats
    owners_cats.map {|x| x.mood = "happy"}
  end

  def sell_pets
  #owner can sell all its pets, which makes them all nervous it also leaves all of the owner's petswithout an owner
    owners_pets = self.cats.concat(self.dogs)
    owners_pets.map{|pet| pet.mood = "nervous"} &&
    owners_pets.map{|pet| pet.owner = nil}
  end
 
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end