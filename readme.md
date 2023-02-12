# Thread Safety
`ruby class_instance_variables.rb`

## instance variables vs class instance variables
* When self is a class, they are instance variables of classes(class instance variables). 
* When self is a object, they are instance variables of objects(instance variables).

## Concept: Global object being operated on by threads
### Unless doing `thread` specifically, not something to worry about in Rails
### Example of non safe
### Example of safe
### Helpful link
* https://blog.arkency.com/3-ways-to-make-your-ruby-object-thread-safe/

## Rails App, thread safety
If you follow rails conventions, and avoid global and class level instance variables, you're mostly* fine.
(*) But are you're gems?

### Helpful links
https://workingwithruby.com/wwrt/intro
https://bearmetal.eu/theden/how-do-i-know-whether-my-rails-app-is-thread-safe-or-not/

