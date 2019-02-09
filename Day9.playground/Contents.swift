/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 9
 
 Structs - Part Two: Initializers, referring to the current instance (self), lazy properties, static properties and methods,
Access Control
 
 */

import UIKit

//Init: Initializers provide different ways to initialize a struct. The default initializer in a Struct is called memberwise initializer. This initializer ask you to provide a value for each property when you create the struct

struct User{
    
    var username: String
    
}

var user = User(username: "fhribeirocosta")

//To start the some variable with a default value, we can provide our own initializer. Let's do it with another struct

struct Car{
    
    var carColor: String
    
    init() {
        carColor = "White"
        print("New cars are White by default")
    }
    
}

var myNewCar = Car()
//Let's paint the car with another color
myNewCar.carColor = "Black"
print("Now my car color is \(myNewCar.carColor)")

//Self: self is a constant which points to whatever instance of the struct which is being used. A common use of Self is using it to refer for a property declared in struct and used in a method, mainly when you have method parameters with the same name of structs properties.
struct Person{
    
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

var person = Person(name: "Swift")

//Time for a powerful Swift feature: Lazy properties. Lazy properties are properties that are created only when needed. So, if we have to create a struct property but will use it in a second moment, is better create a lazy property.

struct FamilyTree{
    
    init() {
        print("Creating family tree!")
    }
    
}

struct FamilyPerson{
    
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
        print("\(self.name) was born!")
    }
}

//If we create a FamilyPerson property, the initializer will have created only the name property
var familyPerson = FamilyPerson(name: "Shrek")

//The familyTree wasn't created yet. Now we will create it.
familyPerson.familyTree = FamilyTree()

//Static properties: Static properties are properties that can be modified only by the struct. It's instances can only read these properties
//In the example below, we have a Student struct which have a static property classSize. This property can only be read by the Student instances and can be modified only in the Student struct

struct Student{
    
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        print("Hello \(name)! Welcome to the class!")
        Student.classSize += 1
    }
    
}

var firstStudent = Student(name: "Steve")
//Because of the classSize property belongs to Student, to access the classSize value, we have to do it using the struct name.
print("Number of student in the class: \(Student.classSize)")

var secondStudent = Student(name: "Bill")
print("Number of student in the class:\(Student.classSize)")

//Access Control: with access control we can protect properties to be accessed and read by the instances of an object. To do it we need to use the keyword private before the var/let declaration
struct Employee{
    
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String{
        return "My employer id is \(id)!"
    }
    
}

var newEmployee = Employee(id: "0088987")
print(newEmployee.identify())


