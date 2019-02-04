/**
 This is a Playground created as part of the 100 Swift challenge - by Hacking with Swift (Paul Hudson)
 @Author: Flavio Costa
 
 DAY 4
 
 Loops
 
 */

import UIKit


//Loops mechanism is: repeat some code until a condition evaluates as false
//The most common loop in Swift is a for loop.

let numbers = 1...10
for number in numbers{
    print("Number: \(number)")
}

//Now let's try with an Array
let cars = ["Ferrari","BMW","Audi"]

for car in cars{
    print("\(car) is an Awesome car!")
}

//If the constant that for loop give to us will be not used, we can use an underscore instead of it.

for _ in 1...5{
    print("It must be printed five times!")
}

//Now is time to know the While loop. To create this loop you give it a condition to check and it's loop will run until the condition fails
var number = 1

while number <= 20{
    print(number)
    number += 1
}

print("Now the number is \(number). The loop finished.")

//Maybe you will never use the next type of loop: Repeat. It's the same as the while loop but you start it with the keyword repeat and the condition must be in the end.

repeat {
    number -= 1
}while number > 1

print("Now the number is \(number) again")


//Oh, if you want to break a loop while it still running?

var countDown = 10

while countDown >= 0 {
    
    print(countDown)
    
    if countDown == 4 {
        print("Oh wait! Let's do it late!")
        break
    }
    countDown -= 1
}

//Now is time to know about nested loop and how to exit from nested loops

for i in 1...10{
    for j in 1...10{
        let product = i * j
        print("\(i)*\(j)= \(product)")
    }
}

//To exit from the loop, there are two steps. First is to add a label in outside loop and then apply the condition to break the loop inside the inner loop.

outerLoop: for i in 1...10{
    for j in 1...10{
        let product = i * j
        print("\(i)*\(j)= \(product)")

        if product == 50{
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

//Ok. If I wanted to skip an item and don't print it, what could I do?
//Let's use continue
for i in 1...10{
    if i % 2 == 1{
        continue
    }
    print(i)
}

//Did you heard about Infinite Loop? Is this a good or bad thing?
//It is good if it has a condition to exit the loop, otherwise it will never ends. It's a bad thing.

var counter = 0

while true{
    
    print("\(counter)")
    counter += 1
    
    if counter == 111{
        break
    }
}
