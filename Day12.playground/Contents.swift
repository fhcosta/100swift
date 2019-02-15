/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 12
 
 Optionals
 
 */
import UIKit

//Optionals are the solution to work with null references.
//We can create variables which are optionals at this moment and change the value og them after.
//Let's create a variable that holds nothing when it is created.
var age: Int? = nil
//Now we can use this variable and give a value for it.
age = 29

//Unwrapping optionals
//When we create an optional variable that holds nothing, if we try to work with it Swift will not allow. To do it, we need to unwrap this optional using the if let syntax. Let's do it.
var myEmptyString: String? = nil

if let unwrapped = myEmptyString{
    print("\(unwrapped.count) letters!")
}else{
    print("Missing value.")
}

//If we give a value for myEmptyString, we can read it.

//Rather than use if let, we can use guard let. Guard let has a behaviour very similar with if let. The difference is Guard let expect you to exit the function when it finds an nil value. With guard let we can keep using the guard code.

func greet(_ name: String?){
    
    guard let unwrapped = name else {
        print("Name wasn't provided!")
        return
    }
    
    print("Hello,\(unwrapped)!")
}

greet(nil)
greet("Flavio")

//Force Unwrapping
//Optionals can hold or not some value. If you have sure that your optional represent some data, you can force unwrapping this optional. To do it we use the exclamation symbol ! .

let str = "5"
let num = Int(str)

//The num constant althought it doesn't seem is an optional. It is an optional because Swift doesn't know if the string you trying to Cast to Int can be done. Let's suppose instead of 5, str was Fish. The casting couldn't be done and num will be nil. Let's try to test with a string that cannot be casted to Int

let str2 = "Fish"
let num2 = Int(str2)

func testCasting(_ number: Int?){
    
    guard let myNum = number else {
        print("It isn't a number")
        return
    }
    
    print("The number is \(myNum)!")
}

testCasting(num2)

//We know that str is a number which can be casting to int, so let's create a new constant to explicitly unwrap it.

let newNum = Int(str)!
testCasting(newNum)

//An unsafe option to unwrap optionals is to create implicitly unwrapped optionals. Doing it we can use this optinal without if let or guard let conditionals. It's is unsafe because if the unwrapped value is null, the code will crash
var someValue: Int! = nil
//var square = someValue * someValue //error

someValue = 3
var square = someValue * someValue //Success

//Nil coalescing
//We can use nil coalescing to check if an optional has a value or not and return something

func username(for id: Int) -> String?{
    if id == 1 {
        return "Taylor Swift"
    }else{
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"

//Optional chaining
//Swift allow us to use optionals when with chains, like a.b.c. If b can be nil, we can put the optional mark ( a.b?.c ) and the rest of the code in this sequence will not be executed.
let names = ["John","Paul","George","Ringo"]
let beatles = names.first?.uppercased() //This code will run perfectly

let noNames: [String] = []
let ghosts = noNames.first?.uppercased() //Ghosts will be nil and uppercased will not be executed because noNames is empty


//Optional try: As an alternative to do, try, catch, we can use optional try. You can user try? and try!. The second one only when you know that value will not be null.
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    
    if password == "password"{
        throw PasswordError.obvious
    }
    
    return true
    
}


if let result = try? checkPassword("password"){
    print("Result was \(result)")
}else{
    print("Fail. Password is quite \(PasswordError.obvious)!")
}

try! checkPassword("Abracadabra")

//Failable initializers
//We can also use optionals with init. When we need to know if a init can really init with the data passed as parameter, we can use init?(parameter: Type).

struct Person{
    var name: String
    
    init?(name: String) {
        if name.count >= 0 {
            self.name = name
        }else{
            return nil
        }
    }
    
}

var sayajin = Person(name: "Goku")

print(sayajin!)


