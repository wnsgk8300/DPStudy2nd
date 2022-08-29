//: [Previous](@previous)

import UIKit

// forEach, map, filter, reduce

var numbers = Array(1...100)

for number in numbers {
    print(number)
}

numbers.forEach { number in
    print(number)
}

numbers.forEach { print($0) }

// ---

var doubledNumbers: [Int] = []

for number in numbers {
    let doubledNjumber = number * 2
    doubledNumbers.append(doubledNjumber)
}
print(doubledNumbers)



numbers.map { number in
    return number * 2
}

print(numbers.map { $0 * 2 })


// ---

var higherThenFIfty: [Int] = []
var higherThenFIfty2: [Int] = []

for number in numbers {
    if number > 50 {
        higherThenFIfty.append(number)
    }
}
print(higherThenFIfty)


for number in numbers where number > 50 {
        higherThenFIfty2.append(number)
    }
print(higherThenFIfty2)


numbers.filter { number in
    return number > 50
}
print(numbers.filter { $0 > 50 })



// ---
var sum = 0

for number in numbers {
    sum += number
}
print(sum)
//            시작값
numbers.reduce(0) { partialResult, number in
    partialResult + number
}
print(numbers.reduce(0) { $0 + $1 })


//: [Next](@next)
