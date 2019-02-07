import UIKit
/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 7
 
 Closures - Part Two
 
 */

//The first block of learning Swift was done. Now it's time to upgrade the level.
//First, let's start using closures as parameters when they accept parameters
//In this first example, there is a function with a closure as parameter. This closure has a string as parameter and no return.
//Inside this function the closure is used and a String is passed as parameter.

func travel(action: (String) -> Void){
    print("I'm getting ready to go")
    action("London")
    print("Arrived")
}

//When we call the function travel we have a String parameter. This string is the value passed inside the function travel: action("London").
travel { (place: String) in
    print("I'm going to \(place) in my Car")
}

//To describe better the process:
//1 - create a function with a closure as parameter
//2 - Inside this function, call the parameter passing the required value
//3 - When call that function with a closure as parameter, remember that closure has a String parameter and no return.

//Another example
func calculate(sum: (Int,Int) -> Void){
    print("Here we have the sum of two numbers")
    sum(3,5)
}

calculate { (n1: Int, n2: Int) in
    print("Result: \(n1+n2)")
}


//Let's return some value now
func ride(type: (String) -> String){
    print("I'm ready to go for a ride.")
    let description = type("Bike Ride")
    print(description)
    print("Climbing a mountain now.")
}

ride { (typeOfRide: String) -> String in
    return "Mountain Bike"
}

func calculate(squareOfSum: (Int, Int) -> Int){
    let result = squareOfSum(3,4)
    print(result)
}

calculate { (number1: Int, number2: Int) -> Int in
    let sum = number1 + number2
    return sum * sum
}

//Do you know how smart is a Closure? Closures know a lot of things
//Let's create a function with a closure as parameter. This closure must have a String as parameter and return type

func learning(pLanguage: (String) -> String){
    print("We are learning a programming language!")
    let programmingLanguage = pLanguage("Swift")
    print(programmingLanguage)
}

//Before we used something like this to call the function and pass the closure as parameter:
learning { (newProgLanguage: String ) -> String in
    return "We are learning: \(newProgLanguage)"
}

//But Swift knows the parameter to that closure must be a string and we can remove the type.. Smart Closure Part I
learning { newProgLanguage -> String in
    return "We are learning: \(newProgLanguage)"
}

//Let's go further. Closure also knows that there is a return value and its type .. Smart Closure Part II
learning { newProgLanguage in
    return "We are learning: \(newProgLanguage)"
}

//Swift also knows when they have only one line of code, it must be that one to return. We can remove the return keyword... Smart Closure Part III
learning { newProgLanguage in
    "We are learning: \(newProgLanguage)"
}

//To simplify a little bit more, Swift has a shorthand syntax and can provide automatic names for closure's parameters. Instead of use newProgLanguage in, we can use only a $0. The $0 will be the closure parameter ... Smart Closure Part IV
learning {
    "We are learning: \($0)"
}

//Let's test the Closure super power and call know the calculate function which has as parameter a closure with two parameters
calculate {
    ($0+$1) * ($0+$1)
}


//We have been using closure as function parameter. Now is time to use as return value.
//As Paul wrote in the HackingWithSwift website, the syntax of returning a closure can be a little bit confusing. We have to use two ->. One for the function return and the other for the closure return.
func newTravel() -> (String) -> Void{
    return {
        print("I'm going to \($0)")
    }
}

let result = newTravel()
result("New Zealand")


//Next closure super power: Capturing Values
//We can create values inside the function and used it inside the closure. Let's track how many times a closure was called
func trackingAClosure() -> (String) -> Void{
    var counter = 1
    
    return {
        print("This closure was called \(counter) times. Let's go to \($0)")
        counter += 1
    }
}

let trackResult = trackingAClosure()
trackResult("London")
trackResult("Tokyo")
trackResult("Beijing")
