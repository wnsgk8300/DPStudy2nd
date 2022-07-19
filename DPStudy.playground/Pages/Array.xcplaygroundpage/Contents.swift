import UIKit

let numArr = Array(11...20) // 시간 복잡도 n, index로 찾을 땐 1

for number in numArr.reversed() {
    print(number) // 20 , 19, 18 ... 11
}

for index in numArr.indices {
    print(index) // 0, 1, 2, ... 9
}

for (index, number) in numArr.enumerated() {
    print(index, number) // 0 11, 1 12, 2 13 ... 9 20
}

// set은 중복 안됨
let numSet: Set<Int> = [1, 2, 3, 3, 3] // set은 시간복잡도 1
print(numSet) //[1, 2, 3]
let numArr2 = [1,2,3,3,3]
print(Set(numArr2)) //[1, 2, 3]

for number in numArr { //시간 복잡도 n
    if number == 2 {
        print(number)
    }
}

// true가 될때까지 하며, repeat 한번은 무조건 실행 됨
repeat {
    
} while true
            
