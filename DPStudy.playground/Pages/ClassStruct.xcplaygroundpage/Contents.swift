import UIKit

// 참조, Reference, 주소를 저장
class Person {
    
    var name: String
    var age: Int
    
    // class 생성할 때 init이 필요함
    // name, age에 값을 직접 주면 init이 없어도 됨
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func speak() {
        print("I can speak")
    }
    
    func changeName(name: String) {
        self.name = name
    }
}
let doyoung = Person(name: "", age: 35)


 // 상속성, Person을 상속함. class만 받을 수 있다. struct는 안됨
class Worker: Person {
    
    // 다형성, 재정의 하기
    override func speak() {
        print("Worked")
    }
}

// 값, Value, 값 자체를 저장, init이 없어도 됨
struct Car {
    var brand: String
    var color: String
    
    // 굳이 재정의 하고 싶을땐 init을 사용하기도 함
//    init(b: String, c: String) {
//        self.brand = b
//        self.color = c
//    }
    
    func stop() {
        
    }
    // struct에서는 mutating이 있어야 바꿀 수 있음
    mutating func changeBrand(brand: String) {
        self.brand = brand
    }
}

// Person은 주소인데, 주소가 아닌 주소 안의 값을 바꿔서 let 사용 가능
let person = Person(name: "A", age: 1)
let person2 = person
person.name = "B"
print(person2.name) //B

// 값 자체를 바꾸기때문에 var사용
var car = Car(brand: "A", color: "red")
let car2 = car
car.brand = "B"
print(car2.brand) //A

class Game {
    let price: Int
    let recommend: String
    init(price: Int, recommend: String) {
        self.price = price
        self.recommend = recommend
    }
    func buy() -> Bool {
        if price == 10 && recommend == "good" {
            return true
        } else {
            return false
        }
    }
}
let g = Game(price: 10, recommend: "good")

// 삼항연산자
print(g.buy() ? print("go") : print("stop"))
