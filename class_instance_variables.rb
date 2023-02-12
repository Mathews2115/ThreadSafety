# Example of Class Instance Variables vs Object Instance Variables
class ClassInstanceVarTest
  @counch = nil # <-- Class level instance variable - shared by all threads - only accessible via Class,not instance level
  @@shared_conch = nil # <-- Static/Global - same except this can be accessed by instance level

  # ===================== Class Instance level examples
  def self.conch(conch_holder)
    @conch ||= conch_holder # <-- also class instance variable
  end

  # singleton method - same as typing def self.still_a_class_level_conch
  class << self
    def still_a_class_level_conch(conch_holder)
      @conch ||= conch_holder
    end
  end

  # instance level method BUT accesses class level variable (shared by all threads)
  def conch(conch_holder)
    self.class.conch conch_holder
  end

  def shared_conch(conch_holder)
    @@shared_conch ||= conch_holder
  end

  # ============ object instance level example
  def object_level_conch(conch_holder)
    @conch ||= conch_holder # <-- object level instance variable - not shared by all threads
  end
end

threads = []

# class level conch
threads << Thread.new do
  puts "#{ClassInstanceVarTest.conch("jake")} has the conch"
end

threads << Thread.new do
  puts "#{ClassInstanceVarTest.conch("mike")} has the conch"
end

threads << Thread.new do
  puts "#{ClassInstanceVarTest.new.conch("jim")} has the conch"
end

threads << Thread.new do
  puts "#{ClassInstanceVarTest.new.class.conch "michael"} has the conch"
end

threads << Thread.new do
  puts "#{ClassInstanceVarTest.still_a_class_level_conch "abel"} has the conch"
end

# Shared conch
threads << Thread.new do
  puts "#{ClassInstanceVarTest.new.shared_conch "jack"} has the shared conch"
end

threads << Thread.new do
  puts "#{ClassInstanceVarTest.new.shared_conch "gaebriel"} has the shared conch"
end

# object level conch
threads << Thread.new do
  puts "! some other conch belongs to #{ClassInstanceVarTest.new.object_level_conch "calvin"}"
end

threads << Thread.new do
  puts "! some other conch belongs to #{ClassInstanceVarTest.new.object_level_conch "matt"}"
end

threads.each { |t| t.join }

puts "\nSummary:"
puts "Note who gets the class level conch"
puts "Note who gets the shared conch"
puts "Now see how Calvin and Matt got their own conch!"
puts "rerun this over and over and see how the conch may change hands depending on which thread runs"
