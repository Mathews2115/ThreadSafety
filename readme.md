# Thread Safety

## instance variables vs class instance variables
Instance Variable scoping is so damn important; check this out:
* When self is a class, they are instance variables of classes(class instance variables). 
* When self is a object, they are instance variables of objects(instance variables).
### Examples
```ruby
class ImSoCleverClass
  @a_class_i_var = "I am a class level instance variable. All threads can see me."
  @@a_class_var = "I am a class variable, I am available through each instance of the object but shared/same between all instantiated objects. - yes, this includes threads"

  def self.class_level_memo(msg = "class level fart")
    @class_level_memo ||= "#{msg}, oh look, a class level Memoization, this is the same as the class instance variable and is of course, shared across threads"
  end

  class << self
    def lol_why(msg = "anotehr class level fart")
      @lol_why ||= "#{msg}, good ol class << self, damn homie, you are one clever rubyist! (class level instanve variable. same as all the above)"
    end
  end

  def initialize(name = "local fart")
    @object_i_var = "Yay! Each instance has a unique version of me, #{name}! Thread safe!  (unless of course you are passing me around to each thread manually, then we will have to set some ground rules!)"
  end

  def call
    # object level scope fun!
    puts @object_i_var # will see it's own message, owned by the object!
    puts @@a_class_var # will also see this, but so will every instance of this object, and it will be the same!

    puts "@a_class_i_var defined? #{!!defined? @a_class_i_var}" # cant see this one!!! Get to this by accessing the class itself. Example: self.class.a_class_i_var
    puts "@class_level_memo defined? #{!!defined? @class_level_memo}" # cant see, assigned to the class, not the object
    puts "@lol_why defined? #{!!defined? @lol_why}" #same as above
  end

  def self.call(msg)
    # Class level fun time!
    puts @object_i_var || "cant see @object_i_var, this is scoped to each individual object instance"
    puts @@a_class_var
    puts @a_class_i_var
    puts class_level_memo(msg)
    puts lol_why(msg)
  end
end

puts "Object Instantiation:"
ImSoCleverClass.new("local fart").call

puts "\n\nClass Level Fun:"
ImSoCleverClass.call("another fart")

puts "\n\nNotice how msg still equals `another fart`:"
ImSoCleverClass.call("ignored fart")

```

## Concept: Global object being operated on by threads

### Example of non safe
### Example of safe
### Helpful link
* https://blog.arkency.com/3-ways-to-make-your-ruby-object-thread-safe/

## Rails App, thread safety
* If you follow rails conventions, and avoid global and class level instance variables, you're mostly* fine.
 * (*) But are you're gems?
* If you are using `Thread.current`, you're probably going to introduce another bug, even if you are attempting to fix an unsafe gem problem.
* Consider wrapping unsafe object access in a mutex

### Helpful links
https://workingwithruby.com/wwrt/intro
https://bearmetal.eu/theden/how-do-i-know-whether-my-rails-app-is-thread-safe-or-not/

