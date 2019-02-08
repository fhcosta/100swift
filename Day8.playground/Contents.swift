/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 8
 
 Structs - Part One
 
 */
import UIKit

//Struct is an abreviation of structure. Struct is the most common way to create our own type, with variables, constants and functions.

struct Sport{
    var name: String
}

//Our struct created has the Sport type.
//Let's create and use an instance of Sport
var mountainBiking = Sport(name: "MTB Marathon")
print(mountainBiking.name)

//Let's change the value of mountainBiking
mountainBiking.name = "Downhill"

//Now it's time to know the difference between stored properties and computed properties. Our Sport struct has a variable name. This variable is a stored property because it stores a given value. Computed properties are properties which runs code to decide the best value to be stored.
//Let's create a new Struct

struct Car{
    
    var brand: String
    var engineIsWorking: Bool

    var carStatus: String{
        if engineIsWorking{
            return "The \(brand) can be used!"
        }else{
            return "Not working. Find a mechanical workshop for your \(brand)!"
        }
    }
}

let myCar = Car(brand: "Mazda", engineIsWorking: false)
print(myCar.carStatus)

//If you want to know when a property value changed and take some action after it, you can use property observers. Let's print a message when the amount value changes
struct Progress{
    var task: String
    var amount: Int {
        didSet{
            print("\(task) is now \(amount)% complete.")
        }
    }
}


var progress = Progress(task: "Loading Data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//We had used methods before, when we created funcs. Now we are going to create methods inside a struct. Each method has a specific job to do. To test it, let's create a City struct with some methods

struct City{
    
    var population: Int
    
    func collectTaxes() -> Int{
        return population * 1000
    }
    
}

let auckland = City(population: 1_500_000)
auckland.collectTaxes()

//Now let's create a new struct with a mutating method. Mutating methods are methods which allows to change a value of property inside they.
struct Person{
    
    var name: String
    
    mutating func makeAnonymous(){
        name = "Anonymous"
    }
}

var person = Person(name: "Cap. Cook")
person.makeAnonymous()
print(person.name)

//Now let's talk a little bit about strings and arrays properties and methods
//First will be String. Strings have their own methods and properties and we can use it to querie and manipulate it.
let testString = "This is a String to do some tests!"

//Let's print how many characteres are in this string
print(testString.count)

//Let's ask to the string if it has a prefix
print(testString.hasPrefix("This"))

//Let's print the string with all characteres uppercase
print(testString.uppercased())

//And we can have all the characteres inside an array alphabetically
print(testString.sorted())

//Now let's do some tests with an array
var toys = ["Woody"]

//Count the number of items
print(toys.count)

//Add new item
toys.append("Buzz")

//Get the index of an item
print(toys.firstIndex(of: "Buzz")!)

//Like strings, arrays can be sorted alphabetically
print(toys.sorted())

//And we can remove an item from the array
toys.remove(at: 1)

print(toys)
