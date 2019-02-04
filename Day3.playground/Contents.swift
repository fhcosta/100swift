/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 3
 
 Operators and Conditions
 
 */
import UIKit

//Do you remeber when you start to learn math at School? 2 + 2, 3 - 1. Now it's time to learn and work with this operators in Swift. Let's see what Swift has to help us in our code.
//I don't know about you, but when I was a child I learned to use operators using some fruits examples. Like this one:
let orange = 4
var apple = 3
var fruits = orange + apple

apple = 4 - 1

//Let's also multiply and divide
let newAppleBag = apple * 4
let sharedOrange = orange / 4

//One of the operators which I did't learn at School was the % (module). The % calculate the remainders after division. It calculate how many times a number fit inside another and the result is the value that's left over. For example, if we have 13 chocolates to share between 4 people, the % will say how many chocolates will remain
let chocolate = 13
let people = 4
let remain = chocolate % people

//The result will be 1, because 4 fits into 13 three times with remainder one.

//Another cool thing is to use operators overloading. We can use the operator + to sum values or to merge values with the same type.
let value1 = 23
let value2 = value1 + 3

//Lets merge two strings now
let firstString = "Swift"
let message = firstString + " is Cool"

//Or merge two arrays of the same type
let northIsland = ["Auckland","Wellington"]
let southIsland = ["Christchurch","Queenstown"]
let newZealand = northIsland + southIsland


//If we want to work with some operators and do it more simple, we can use compound assignment operators.
var flightsToday = 20
let newFlights = 12

flightsToday += newFlights

var myMessage = "We are learning the programming language "
myMessage += "Swift"

//Let's learn now how to compare values. We can use == to check if two values are equal and != to check if two values are different from each other. The result is a boolean (true or false).
let bike = 10
let car = 21

bike == car //false
bike != car //true

//We can also use > or < operators
bike >= car
bike <= car

"Swift" >= "Language" //Alphabetical order

//If you learned operators, it's time to learn conditions. Let's start using if statement and print something with a function called print().
let firstCard = 11
let secondCard = 10
if firstCard + secondCard == 21{
    print("Blackjack!")
}else{
    print("Regular cards!")
}

//if this condition is true, the text Blackjack! will be printed. If it's not true, Regular Card! will be printed.

//If we have more than one condition to check, we can else else if
if firstCard + secondCard == 2{
    print("Aces - lucky!")
}else if firstCard + secondCard == 21{
    print("Blackjack!")
}else{
    print("Regular cards!")
}

//Let's combine two conditions together. We can use for it the special operators && (and) and || (or)
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18{
    print("Both are over 18")
}else if age1 > 18 || age2 > 18{
    print("One of them is over 18")
}

//Next level: ternary operator
//Ternary operator is a condition plus true or false blocks all in one, split up by a question mark and a colon

let firstValue = 10
let secondValue = 11
print(firstValue == secondValue ? "Cards are the same" : "Cards are different")

//In a ternary operator we have three values. First check the condition, then after a ? is the result if the condition is true. Finally, after :, the result if the condition is false

//The ternary code above has the meaning of the regular condition below:
if firstValue == secondValue{
    print("Cards are the same")
}else{
    print("Cards are different")
}

//Do you know the Switch Statements? No. The time for it came. Switch is used when you have several conditions using if and else. You can create some conditions and what to do if it is true. To cover all possibilities, you have to use default as the last case.
let weather = "sunny"

switch weather {
case "rain":
    print("Bring umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

//Swift will only run the code inside each case. To continue to the next case, use the fallthrough keyword.

switch weather {
case "rain":
    print("Bring umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

//Now it's time to know the power of range (rsss) with switch. With Range we can use range of values to create conditions

let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did ok.")
default:
    print("You did great!")
}

