//: [Previous](@previous)

import Foundation

var num = 1

// inout: 밖에 있는 값을 받아옴, 주소값
func add(value: inout Int) {
    value += 1
}

add(value: &num)
print(num)

//: [Next](@next)
