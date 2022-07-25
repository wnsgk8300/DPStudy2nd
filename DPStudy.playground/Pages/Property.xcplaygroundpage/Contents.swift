//: [Previous](@previous)

import UIKit

class Food {
    // Stored Property
    var greeting = "Hello, playground"
    // 객체화 안시키고 사용할 수 있음
    static let a = "A"
    
    // MARK: - computed Property
    // Computed Property: 저장된 값도 없고, 저장 할 수도 없음. 사용시마다 뭔가를 계산함.
    var desc: String {
        return "my name is \(greeting)"
    }
    // get set은 보통 코드 가독성 위해 사용, VC에서 class 프로퍼티를 가져오기만 하면 됨
    var des: String {
        get {
            print("GET")
            return "hello \(greeting)"
        }
        set {
            print("SET")
            greeting = newValue
        }
    }
    
    // Property Observer
    // UI변경시 주로 사용함.
    var favoriteFood = "Steak" {
        didSet {
            print(oldValue)
        } willSet {
            print(newValue)
        }
    }
}
var food = Food()
food.favoriteFood = "burger" // "Steak"(OldValue) "burger"(NewValue)


print(food.des) // GET "hello Hello, playground"
food.des = "dd" // SET
print(food.des) //GET "hello dd"

// static
Food.a

food.des

