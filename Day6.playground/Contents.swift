/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 6
 
 Closures - Part One
 
 */

import UIKit

//For me one of the most hard thing to understand is Closures. So, let's put some nickels in the machine and try to hit the jackpot!

//To understand closures you have to understand functions. Funtions can be assigned to a variable, call that function using that variable and pass that function as parameter into other functions

//Come on, so what is a closure? Is what we just described above. Closures are functions assigned to a variable, call that function using that variable and pass that function as parameter into other functions.  Repeat 10x

//Simple example of closure
let driving = {
    print("I'm driving my car")
}

driving()

//To pass some parameters to the closure, you have to write it inside the braces and inside parentheses. After the closing parentheses we have to write in. Closures don't have external parameters.
let personName = {(name: String) in
    print("My name is \(name) and I'm enjoying this challenge!")
}

personName("Flavio")

//wait, but you don't have to use the label name before the value to pass the parameter? No. With functions yep, but not with closures.
//Let's write a closure that returns a value. Thinking in a function, the returning declaration is the same. Just after the parentheses we write -> and the return type.

let drivingWithReturn = {(place: String) -> String in
    return "I'm driving to \(place) in my car!"
}

print(drivingWithReturn("Queenstown"))

let result = {(number1: Int, number2: Int) -> Int in
    return number1 * number2
}

print(result(2,5))

//We had above two examples of closures with return. The first one returns a string and the second an Int

//To make the things a little bit hard, let's pass a closure as a function parameter
//Let's create a closure without returning ( -> Void) and pass it as parameter to a function

let pLanguage = {
    print("I'm learning Swift!")
}

func whatImDoing(studying: () -> Void){
    print("Breakfast!")
    studying()
    print("English Class")
}


whatImDoing(studying: pLanguage)

//Let's complicate more. When the last parameter to a function is a closure, Swift lets you use trailing closure syntax. Rather than pass it as a parameter, you pass it directly after the function inside braces
whatImDoing{
    print("I'm learning Swift")
}

//Next - Closure Part Two - Day 7
