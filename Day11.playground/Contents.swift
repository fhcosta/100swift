/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 11
 
 Protocols and Extensions
 
 */
import UIKit

//Protocols brings a new development paradigm: Protocols Oriented Programming (POP)
//Rather than use complex inheritance hierarchies we can write protocols and have a collection of blueprint behaviours and features.

//Protocols
//The difference between using Protocol and class Inheritance is that protocols have no implemented methods or properties with some values.
//With Protocols we just write what a struct or class have to do or to have. When a struct or class use a Protocol we can say they are conforming or adopting that protocol.
//First, let's create a simple Protocol called Identifiable. In this protocol we will have a id String and all the conforming types will have to implement this property.
protocol Identifiable{
    var id: String {get set}
}
//The variable id can be read and written by the conforming types. It's why we wrote get and set inside the braces
//Protocols can't be instantiated because it's a description not a type. What we can do is create a struct or class that conforms with this protocol.

struct User: Identifiable{
    var id: String
}
//If we remove the id variable, the struct created won't be conformed with the Identifiable Protocol.

//We also can define mehtod paramethers to be of a type that conforms with a protocol.
func displayID(thing: Identifiable){
    print("My Id is: \(thing.id)")
}

//Protocol inheritance
//Inheritance for protocols is a powerful and helpful feature. We can have protocols which inherit from multiple protocols at the same time.
protocol Payable{
    func calculateWages() -> Int
}

protocol NeedsTraining{
    func study()
}

protocol HasVacation{
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation{}

//Extensions: With extensions we can add some code in to existing types, adding to them features that they haven't.

extension Int{
    func squared() -> Int{
        return self * self
    }
}

let number = 9
print(number.squared())

//We can also add computed properties in extensions. Stored properties aren't allowed.
extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
}

print(number.isEven)


//Protocol Extensions: Protocols can't have implemented methods or stored values. Using extension we can solve this problem.
//Collection is a type of Protocol. Strings, Arrays, Sets and others are Collections. So, let's create a extension for the protocol Collection and add some method
let mountainBikes = ["Scott","Specialized","Merida","Trek","Cannondale","Santa Cruz"]
let roadBikes = Set(["Pinarello","Colnago","Cerveló","Campagnolo","Cippolini","Colnago"])

extension Collection{
    func summarize(){
        print("There are \(count) bikes:")
        for name in self{
            print(name)
        }
    }
}

mountainBikes.summarize()
roadBikes.summarize()

//Protocol Oriented Programming: Now let's apply some POP techniques using extension and protocols
protocol Available{
    var isAvailable: Bool {get set}
    func availability()
}

extension Available{
    
    func availability(){
        print("I'm available: \(isAvailable)")
    }
    
}

struct Person: Available{
    var isAvailable: Bool
}

let someone = Person(isAvailable: true)
someone.availability()



