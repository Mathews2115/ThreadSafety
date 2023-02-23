class SpacePerson
  @@instances = 0 # Hi, I'm a "class variable", access me in the local instance and on the class!

  def initialize(name)
    @name = name
    @@instances += 1
    @number = @@instances
  end

  def speak
    puts "Hello, my name is #{@name}, #{@number} of #{@@instances}"
  end

  def self.total
    @@instances
  end
end

SpacePerson.new("jake").speak # Hello, my name is jake, 1 of 1
SpacePerson.new("mike").speak # Hello, my name is mike, 2 of 2
puts "HEY JOHN AND COLLIN: SANITY CHECK FAILED - PROD FIRE" if SpacePerson.total > 2 # you're safe guys, don't worry


class SpacePerson
  @@instances = 0 # Hi, I'm a "class variable", access me in the local instance and on the class!

  def initialize(name)
    @name = name
    @@instances += 1
    @number = @@instances
  end

  def speak
    puts "Hello, my name is #{@name}, #{@number} of #{@@instances}"
  end

  def self.total
    @@instances
  end
end


threads = []

# pretend this is two separate requests running concurrently
2.times do
  threads << Thread.new do
    SpacePerson.new("jake").speak # Hello, my name is jake, 1 of 1
    SpacePerson.new("mike").speak # Hello, my name is mike, 2 of 2
    puts "HEY JOHN AND COLLIN: SANITY CHECK FAILED - PROD FIRE" if SpacePerson.total > 2
  end
end

threads.each(&:join)

# Hello, my name is jake, 1 of 1
# Hello, my name is mike, 3 of 3
# HEY JOHN AND COLLIN: SANITY CHECK FAILED - PROD FIRE
# Hello, my name is jake, 2 of 2
# Hello, my name is mike, 4 of 4
# HEY JOHN AND COLLIN: SANITY CHECK FAILED - PROD FIRE
