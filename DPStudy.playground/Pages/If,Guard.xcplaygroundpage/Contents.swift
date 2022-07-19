import UIKit

let temp = 30

func feelGuard(t: Int) {
    // 가독성떄문에 if 대신 사용
    // if를 쓰면 depth가 계속 늘어남
    // 가능하면 guard쓰고 안되면 if를 쓰는것도 괜찮음
    guard t > 25 else { return /* 함수를 무조건 종료*/}
    print("")
    guard t > 25 else { return }
    print("")
    guard t > 25 else { return }
    print("")
}

func feelIf(t: Int) {
    // 이런슥으로 길어지는 경우가 생김
    if t > 25 {
        print("")
        if t > 20 {
            print("")
            if t > 25 {
                print("")
            }
        }
    }
}

feelGuard(t: 20)
