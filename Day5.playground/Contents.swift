/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 5
 
 Functions
 
 */

import UIKit

//Functions are pieces of code which we can reuse, generally responsable to do an specific job. A Function can have a input and an output value or neither. So, now is functions time!

//Let's write a function to print a SOS message. This function has no input.
func printSOS(){
    
    let message = """
Help!!
I'm lost in a desert island.
I think it's Madagascar.
"""
    
    print(message)
    
}

//Calling a function
printSOS()


//To use functions with some input, we have to send parameters. Parameters are setted inside the parentheses, with or without a name and the type of it.

//This function have an Int as parameter with the name number. Inside this function we have an math operation to calculate the square of the number sent as parameter
func square(number: Int){
    print(number * number)
}

//When the function has a parameter, we call the function and inside the paramethers we write the parameter name and the value.
square(number: 8)

//Parameters are input. To have a output in a function, it has to have a return value. To write a function that has a return value, after the parentheses we write -> followed by the return type.

func squareWithReturn(number: Int) -> Int{
    
    let squareOfNumber = number * number
    return squareOfNumber
}

let result = squareWithReturn(number: 8)
print(result)


//We can also use a label for the parameters. The label will be used externally when calling a function and the other one to be used internally
func sayHello(to name: String){
    print("Hello \(name)!")
}

sayHello(to: "Steve")

//Now let's build a function that hide the external label but has a label to use internally.
func greet(_ person: String){
    print("Hello, \(person)!")
}

greet("Wozniak")

//Let's write a function that has a default parameter
func greeting(to name:String, nicely: Bool = true){
    if nicely {
        print("Hello Mr/Ms \(name)! How are you?")
    }else{
        print("Hey \(name)")
    }
}

greeting(to: "John")
greeting(to: "Steve", nicely: false)

//Do you know about variadic functions? Now I know!!
//Variadic functions is when you have any number of parameters of the same type.

func sayHelloToEverybody(names: String...){
    for name in names{
        print("Hello \(name)")
    }
}

sayHelloToEverybody(names: "Steve", "John","Mariza", "Satya")

//When we have an error internally in a function, is a good practice to have a error treatment. To do it we can use throws.

//First we need a Enum to represent our error type

enum PasswordError: Error{
    case obvious
}

func checkPassword(_ password: String) throws -> Bool{
    
    if password == "password"{
        throw PasswordError.obvious
    }
    
    return true
}

//To run throwing function we have to use the do/try/catch keywords
do{
    try checkPassword("ABCD")
    print("That password is good")
}catch{
    print("You can't use that password")
}

//Another new thing for me was the use of inout parameters
//Functions parameters are constants by default. To change the value you need to pass a parameter as inout. An inout value can be changed inside the funtion and outside it.

func doubleNumber(number: inout Int){
    number *= 2
}

var myNum = 10
doubleNumber(number: &myNum) //when we are passing inout parameters, we have to use the ampersand &
print(myNum)

