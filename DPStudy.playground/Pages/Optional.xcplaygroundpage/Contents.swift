
import UIKit

let num: Int? = nil

// Binding

if let num = num {
    print(num)
} else {
    print("This is Nil")
}

func Opt() {
    guard let num = num else {
        print("This is Nil")
        return
    }
    print(num)
}

class Person {
    func opt() {
        
    }
}
let person: Person? = nil
// Optional Chaining
// ?가 nil이면 뒤는 실행 안됨
person?.opt()
