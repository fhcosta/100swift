/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 10
 
 Classes
 
 */
import UIKit

//Classes are very similar to Struct, both can have properties and methods. The main difference between then is Classes can implement Inheritance. In OOP, Inheritance is when a class has other class as a "Blueprint" and inherits some features and behaviours.
//In 100 Swift days, Paul explains some difference between class and structs. The differences will be explained one at a time.

//Creating a class
//First difference: Classes never came with a memberwise initialiser. So, if we have properties in our class, we must create our initializer.
class Dog{
    
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise(){
        print("Woof!")
    }
    
}

let montana = Dog(name: "Montana", breed: "Labrador")

//Second Difference: Inheritance. Classes can inherits some features and behaviours from they superclass. Child classes can have they own initializers, but the super class initializer must be called inside of it.

class Labrador: Dog{
    
    init(name: String){
        super.init(name: name, breed: "Labrador")
    }
    
}

let linda = Labrador(name: "Linda")


//If we want to override, that is, rewrite some super class method, it is possible.
class Bulldog: Dog{
    
    init(name: String) {
        super.init(name: name, breed: "Bulldog")
    }
    
    override func makeNoise() {
        print("Bloof!")
    }
}

//Suppose that you want to create a Class and don't it to be inherited. To do it, you can define this class as final. When creating the class, just insert the keyword final before the keyword class. No one can inherit from your class.


final class Cat{
    
    var name: String
    var fed: Bool
    
    init(name: String, fed: Bool) {
        self.name = name
        self.fed = fed
    }
    
    func makeNoise(){
        print("Meow!")
    }
    
}


//Third difference: Copying objects. Classes are reference types while structs are value types. Reference types (Classes) when copied, the original and the copy point to the same thing. If you change one the other one also will be changed. On the other hand, a value type (Struct) when copied, the original and the copy are differents. If you change one, the other one will continue the same value.
class Singer{
    var name = "Elvis Presley"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Michael Jackson"

print(singer.name)
print(singerCopy.name)

//In the example above, if we change the class for struct, singer.name will be Elvis Presley and singerCopy.name will be Michael Jackson. We have two properties pointing each one for a object

//Fourth Difference: Deinitializers. Initializers are code runned when we are initializing a instance of a class or struct. Deinitializer is when this instance is being destroyed.

class Person{
    
    var name = "Robinson Crusoe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting(){
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

//Let's create a loop to create and destroy instance of the class Person.
for _ in 1...3{
    let person = Person()
    person.printGreeting()
}


//Fifty difference: Variables properties created in a constant Struct cannot be changed without the mutating keyword. On the other hand, constant Classes variables can be changed without the mutating keyword.

class Musician{
    
    var name = "Freddy Mercury"
    
}

let musician = Musician()
musician.name = "Adam Levigne"

print(musician.name)

