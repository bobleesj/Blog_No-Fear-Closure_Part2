
// Created by Bob 
// https://facebook.com/bobthedeveloper


import Foundation
import UIKit


// Global Closure (a.k.a function)
func timesTenFunc(number: Int) -> Int { return number * 10 }
// Normal Closure
var timesTenClosure: (Int) -> Int = { $0 * 10 }
// Test👆
timesTenFunc(number: 10) // 100
timesTenClosure(10) // 100


func sum(from: Int, to: Int, closure: (Int) -> (Int)) -> Int {
  var sum = 0
  for i in from...to {
    sum += closure(i)
  }
  return sum
}

sum(from: 0, to: 10, closure: timesTenFunc) // 550
sum(from: 0, to: 10, closure: timesTenClosure) // 550

// Longer Version
sum(from: 0, to: 10, closure: { number in return number * 10 })
// Shorter Version
sum(from: 0, to: 10, closure: { $0 * 10 })


// Trailing Closure Longer Version
sum(from: 0, to: 10) { (number) in
  return number * 10
}
// Trailing Closure Shorter Version
sum(from: 0, to: 10) { return $0 * 10}
// Trailing Closure Extremely Short Version
sum(from: 0, to: 10) { $0 * 10 }


// ViewController Present 

// self.present(nextViewController, animated: true, completion: nil)
// self.present(nextViewController, animated: true, completion: {
// print("Hello World")
// })



// COMPLETION HANDLERS
// Create Function
func downloadFileFromURL(url: NSURL, completionHandler: (Bool) -> Void) {
  // NSURL logic code & download. (return false/true)
  // Download has been completed
  completionHandler(true)
}



// Run function
downloadFileFromURL(url: NSURL(string: "abc")!, completionHandler: {
  isSuccessful -> Void in
  if isSuccessful {
    print("You've downloaded")
  } else {
    print("Unexpected error encountered")
  }
})



// API Example
/*
fetchProfileImage() { (imageFile, name, error) in
  if error == nil {
    // put into UIImage with imageFile/name
  }
}
*/

// ESCAPTING CLOSURES
var completionHandlers: [() -> Void] = []

// It doesn't work!
//func functionWithCompletionHandler(block: () -> Void) {
//  completionHandlers.append(block)
//}

func functionWithCompletionHandler(block: @escaping () -> Void) {
  completionHandlers.append(block)
}

functionWithCompletionHandler(block: { print("hello") })
completionHandlers[0]() // "hello"

