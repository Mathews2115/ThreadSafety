class SpacePerson
  @instances = 0 # Hi, I'm a "class INSTANCE variable", access through the "class" instance
  # from Ruby docs:
  # It does not belong to an instance of class SpacePerson, but to the class object SpacePerson,
  # which is an instance of class Class. lol

  def initialize(name)
    @name = name
    self.class.bump
    @number = self.class.total
  end

  def speak
    puts "Hello, my name is #{@name}, #{@number} of #{self.class.total}"
  end

  def self.total
    @instances
  end

  def self.bump
    @instances += 1
  end
end

SpacePerson.new("jake").speak # Hello, my name is jake, 1 of 1
SpacePerson.new("mike").speak # Hello, my name is mike, 2 of 2
puts "HEY JOHN AND COLLIN: SANITY CHECK FAILED - PROD FIRE" if SpacePerson.total > 2 # you're safe guys, don't worry


# fun for later lol
# class << self
#   attr_accessor :instances  # provide class methods for reading/writing
# end
