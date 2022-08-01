//: [Previous](@previous)

import UIKit

//Type Casting: Class에서 주로 사용
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
// Doctor = Person ,  But Person != Doctor
class Doctor: Person {
    let location: String
    
    // 상속 완료
    init(name: String, location: String) {
        // self가 super보다 먼저 들어가있어야함
        self.location = location
        super.init(name: name)
    }
}

class Developer: Person {
    let food: String
    
    init(name: String, food: String) {
        self.food = food
        super.init(name: name)
    }
}

// Down Casting - 실패의 여지가 있어서 guard or if룰 사용하여 처리함
// TableView에서 주로 사용
let doctor = Doctor(name: "ss", location: "Seoul")
let bool = doctor is Person
let bool2 = doctor is Developer
print(bool, bool2) // true, false

// UP Casting - 무조건 성공하므로 guard, if 필요 없음
func check() {
    let a = doctor as Person
}



//: [Next](@next)
