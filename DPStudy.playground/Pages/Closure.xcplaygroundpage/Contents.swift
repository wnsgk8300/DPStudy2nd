//: [Previous](@previous)

import Foundation

// MARK: - Closure: 함수가 Closure의 일종임, 함수가 이름이 있는 클로져임, 클로저는 참조임

// name Closure        () -> ()
func myFunction(closure: () -> Void) {
    print("myFunction!")
    closure()
}

func voidFunction() {
    print("void!")
}

myFunction(closure: voidFunction) // myFunction!, void!  순서로 출력
myFunction { //myFunction
    print("closure!")
}

func voidFunction(value: String) -> Void {
  print(value)
}
let closure: (String) -> Void = { value in
    print(value)
}
let closure2: (String, String) -> Void = {
    print($0)
    print($1)
}
// 같다고 볼 수 있지만 호출할 때 자동완성에 차이가 있음
voidFunction(value: "void")
closure("closure")
closure2("$0!", "$1!") // $0! $1!

// unNamed Closure, 이름 없는 함수: Closure
//{ }

//: [Next](@next)

