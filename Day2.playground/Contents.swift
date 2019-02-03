/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 2
 
 */
import UIKit

//Arrays is one of the collection types that Swift works. Arrays are a group of single values.
var thisIsAStringArray = ["Auckland","Brazil","New Zealand","California"]

/*This array has 4 indexes. An array start at index 0. If you try to access a index higher which is higher than the array size, you have an error. To access an array index, you have to put the index value inside brackets after the array name. Array positions start at index 0.
 */
thisIsAStringArray[0] //This will access the first element in the array: Auckland

//To create an Array using type annotations, just put the array type inside brackets before the value
var thisIsAStringArrayWithAnnotations: [String] = ["A","E","I","O","U"]

//If you want to create a collection of items, the order of this element can be anyone and you will have only unique values, the best choice is to use a Set collection.
let value1 = "Auckland"
let value2 = "Brazil"
let value3 = "New Zealand"
let value4 = "California"

let mySet = ([value1,value2,value3,value4])

//If we add a new value to mySet with the value "Brazil", mySet will ignore it because it already has this value.

//Now is time for another collection type: Tuples. Tuples has some rules than arrays. First, you can't add or remove items from a tuple. Second, you can't change the types of item in a tuple, but you can create different types. Third, the access to an item in a tuple is different from array. Let's see how to create and access a tuple.

var myTuple = (car: "Ferrari", price:1_000_000)
var carName = myTuple.car
var carPrice = myTuple.1

//The code above shows a tuple holding a String and an Int value. We created two variables to store the car name and the car price. Tuples can work with different values.


//Wait!! How of this collections is better to use? Paul Hudson can help us to understand when use each of these collections.

//Tuples are good to created specific values, fixed and each one with a value.
let address = (city:"Auckland", population: 1_500_0000, isTheCountryCapital: false)

//If you need a collection of unique values, fast to access and don't care about the collection order, use Set
let movies = (["Lord of The Rings","Harry Potter", "Star Wars"])

//If you need a collection of values and this values can be duplicated or the order of the items matters, let's use an array
let myCar = ["Lamborghini","Masserati","Lamborghini", "Ferrari"]

//Probably you will use array more than others.

/*Now is time to learn another type of collection. We present to you Dictionaries.
 Dictionaries use key and values to work. You can use a key to access its value. As the other collections type each item is separated with a comma. To separate the key and value, we use :.*/

let macOSEarlyVersions: [String:Double] = ["Cheetah": 10.0,"Puma":10.1,"Jaguar":10.2]

let firstVersionNumber = macOSEarlyVersions["Cheetah"]

//In the example above, the value of the item with the key "Cheetah", is stored in a constant. We created a dictionary using type annotations. You can create without type annotations.

//Now is time to add a default value to a new dictionary. If we request a value from a dictionary and the key used doesn't exist, we can add a default value.

let myBeers = ["Favorite":"IPA","Winter":"Stout","Summer":"Pilsen"]

let favoriteBeer = myBeers["Favorite"]

//Now let's access a key that doesn't exists and give to it a default value
let myDefaultBeer = myBeers["Default",default: "Lager"]

//If you want to create empty collections, it's easy. Just remember to use a variable and not a constant.
//First, an empty array
var emptyArray = [String]()
//Let's add a value in this array
emptyArray.append("It is a new Item")

//Empty Set
var emptySet = Set<String>()
emptySet.insert("My set value")

//Empty Dictionary
var emptyDictionary = Dictionary<String,Double>()
emptyDictionary["PI"] = 3.14

//Are you ready for enumerations(enums)?
//Enums are a way that Swift provides to organize related values and make it easier to use
//A good example is using coordinates.
var coordinate1 = "North"
var coordinate2 = "South"
var coordinate3 = "East"
var coordinate4 = "West"

//Each one of the constant above represents a coordinate. How can we do it better? Let's use Enum now.
enum Coordinate {
    case north
    case south
    case east
    case west
}

let newCoordinate1 = Coordinate.north
let newCoordinate2 = Coordinate.south
let newCoordinate3 = Coordinate.east
let newCoordinate4 = Coordinate.west

//Now the coordinates are organized and more readable. Chances for error were reduced.

//To use enum with associated values is very easy. Like the example from Paul Hudson, let's create a enum that stores various kinds of activities
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic:String)
    case singing(volume:String)
}

let running = Activity.running(destination: "Auckland Domain")

//Enum with associated values can add more details about the enum.
//What more can we do with enum? enum raw values.
//Let's create a Planet enum and add some values for each case.
enum Planet:Int{
    case mercury = 1
    case venus
    case earth
    case mars
}

let earthValue = Planet.earth.rawValue
//or
let marsValue = Planet(rawValue: 4)

