/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa

 DAY 1

 Variables, simple data types, and string interpolation
 
 */
import UIKit

//Variable: used to store program data. A variable can vary and can store a lot of types of data
//This first variable created store a String
var challengeName = "100 Days with Swift"

//A variable can vary, so we can change the value. Let's change the value of the variable already created.
challengeName = "100 Days with Swift: Challenge Accepted!"


//Do you know what is a type-safe language? In a type-safe language, like Swift, all variable must be of one specific type. The variable create before, called challengeName, is a String with the text "100 Days with Swift: Challenge Accepted!". We did't assigned the variable with its type. Swift did it for us. Now let's create a new variable that store an Integer value.
var myInteger = 100

//To create a large number and turn it more readable, we can insert underscores as thousands separators
myInteger = 8_000_000

//Coming back to Strings, now is time to store a text with multiple lines. To do it, let's create a new variable.

var myMultiLinesVariable = """
This is a nice method
to learn Swift.
Thanks Paul
"""

//If you want to write a String in multiple lines but you want to store and show it in a single line, just put a \ in the end of the middle lines
var mySingleLineVariable = """
This is a Single \
Line variable
"""

/*Now its time to create a variable which store a double-precision floating-point number. WTF, what is a double-precision floating-point number??? This is the full name of a guy knowed by double. Double holds fractional values like 3.14 or 100.011123311231. Double values cannot be mixed with integer. Let's create a double and store it in a variable with the name pi.
 */
var pi = 3.14

//pi = myInteger //This is an ERROR.. a double variable cannot store an Integer value


/*Are you trying to learn Swift? True or false? Whatever is your answer, but of course is true, it will be a boolean value in Swift. The variable below store a boolean value true. */
var swiftIsAwesome = true

/*What we have to do if we want to print or just store a string with the combination of a text and a Double? We can put any type of variable inside our string. To do it we need to put a backslash and the variable between parentheses. Let's use string interpolation.
*/
var myStringInterpolation = "The value of pi is \(pi)"

/*Until now we used only variable to store values. Variables can vary. If we want to store a value that never changes,a variable is not a good option. For it we have a constant. In Swift we create constants with the keyword let. Use constants as often as possible instead of variable
 */
let dayHours = 24

//If you try to change the constant dayHours, you'll have an error. Constants cannot be changed!

/*
 For all the variables and constants created until now, Swift help us with its Type Inference feature. Type inference is when Swift infers the type of the variable or constant based in the value inserted. If you want to create values and define the type without Swift's type inference, you can use Type Annotations. Type Annotations is when you create a variable or constant and say its type.
 */
let myDoubleValue: Double = 2.56
var myStringValue: String = "This is an example of Type Annonation"
let myBooleanValue: Bool = false
var myIntegerValue: Int = 100



