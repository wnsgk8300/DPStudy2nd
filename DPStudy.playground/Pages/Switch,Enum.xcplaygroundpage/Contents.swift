import UIKit

enum Network {
    case cellular
    case wifi
    case bluetooth
}

let network: Network = .cellular

switch network {
case .cellular:
    print("cel")
    // 여기서 걸려도 wifi도 무조건 실행함, wifi가 실제로 프린트됨
    fallthrough
case .wifi:
    print("wifi")
case .bluetooth:
    print("blue")
}

// Control Flow
// continue: 해당 반복 즉시 중단하고, 다음 반복 실행
// break: 해당 반복 즉시 중단, 모든 반복 중단
// return: 함수를 종료,
// fallthrough: switch 문에서 다음 case를 실행시킴

let numArr: Array<Int> = Array(1...10)
for n in numArr {
    if n == 3 {
        // 3 빼고 다 출력됨
        continue
    }
    print(n)
}
