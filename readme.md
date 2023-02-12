# Thread Safety

## instance variables vs class instance variables
* When self is a class, they are instance variables of classes(class instance variables). 
* When self is a object, they are instance variables of objects(instance variables). - 

## Concept: Global object being operated on by threads
### Unless doing `thread` specifically, not something to worry about in Rails
### Example of non safe
### Example of safe
### Helpful link
* https://blog.arkency.com/3-ways-to-make-your-ruby-object-thread-safe/

## Rails App, thread safety
### Helpful links
https://bearmetal.eu/theden/how-do-i-know-whether-my-rails-app-is-thread-safe-or-not/

