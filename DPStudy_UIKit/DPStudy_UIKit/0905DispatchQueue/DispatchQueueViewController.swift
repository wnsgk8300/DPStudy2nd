//
//  DispatchQueueViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/05.
//

import UIKit

class DispatchQueueViewController: UIViewController {
    
    var value = 0
    
    override func viewDidLoad() {
        setUI()
//        globalAsync()
//        globalSync()
        semaphor()
    }
}

extension DispatchQueueViewController {
    
    // 비슷하게 동작하지만 완전 다른 개념이다
    // Sync, Async
    // serial, Concurrent
    
    func globalAsync() {
        
        // Serial - 하나의 스레드
        // 속도의 제한이 있음, 일을 원하는 순서대로 처리할 수 있음
        DispatchQueue.main
        value = 10
        
        // Concurrent - 여러개의 스레드
        //Asunc: 기다리지 않음
        DispatchQueue.global().async {
            sleep(2)
            self.value = 20
            print(self.value, 1)
        }
        DispatchQueue.global().async {
            sleep(2)
            self.value = 30
            print(self.value, 2)
        }
        DispatchQueue.global().async {
            sleep(2)
            self.value = 40
            print(self.value, 3)
        }
        DispatchQueue.global().async {
            sleep(2)
            self.value = 50
            print(self.value, 4)
        }
        print(value) //Main 스레드
        
    }
    func globalSync() {
        value = 10
        // Concurrent - 여러개의 스레드
        // Sync: 기다림
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 20
            print(self.value, 1)
        }
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 30
            print(self.value, 2)
        }
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 40
            print(self.value, 3)
        }
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 50
            print(self.value, 4)
        }
        print(value) //Main 스레드
    }
    
    func serialAsync() {
        // private queue, custom queue: global에서 보장받지 못하는 내가 원하는 스레드로 보내는 걸 보장받을 수 있다.
        // 기본 값이 Serial임,
        // quality of service 작업을 얼마나 빨리 처리해야할 지
        let queue = DispatchQueue(label: "private", qos: .default)
        queue.async {
            sleep(2)
            self.value = 20
            print(self.value, 1)
        }
        queue.async {
            sleep(2)
            self.value = 30
            print(self.value, 2)
        }
        queue.async {
            sleep(2)
            self.value = 40
            print(self.value, 3)
        }
        queue.async {
            sleep(2)
            self.value = 50
            print(self.value, 4)
        }
    }
    
    func serialSync() {
        // private queue, custom queue: global에서 보장받지 못하는 내가 원하는 스레드로 보내는 걸 보장받을 수 있다.
        // 기본 값이 Serial임,
        let queue = DispatchQueue(label: "private", qos: .default)
        queue.sync {
            sleep(2)
            self.value = 20
            print(self.value, 1)
        }
        queue.sync {
            sleep(2)
            self.value = 30
            print(self.value, 2)
        }
        queue.sync {
            sleep(2)
            self.value = 40
            print(self.value, 3)
        }
        queue.sync {
            sleep(2)
            self.value = 50
            print(self.value, 4)
        }
    }
    func dispatchGroup() {
        // 여러가지 작업을 동시에 끝내고 어떤 작업을 해야할 때
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global().async {
            sleep(2)
            self.value = 20
            print(self.value, 1)
            group.leave()
        }
        group.enter()
        DispatchQueue.global().async {
            sleep(2)
            self.value = 30
            print(self.value, 2)
            group.leave()
        }
        group.enter()
        DispatchQueue.global().async {
            sleep(4)
            self.value = 40
            print(self.value, 3)
            group.leave()
        }
        group.enter()
        DispatchQueue.global().async {
            sleep(1)
            self.value = 50
            print(self.value, 4)
            group.leave()
        }
        group.notify(queue: .main, execute: {
            print("Done")
        })
        
    }
    
    func semaphor() {
        let group = DispatchGroup()
        // dispatch작업의 개수를 제한할 수 있음
        let semaphor = DispatchSemaphore(value: 2) // 2
        group.enter()
        semaphor.wait() // -1
        DispatchQueue.global().async {
            sleep(3)
            self.value = 20
            print(self.value, 1)
            group.leave()
            semaphor.signal() // +1
        }
        group.enter()
        semaphor.wait() // -1
        DispatchQueue.global().async {
            sleep(5)
            self.value = 30
            print(self.value, 2)
            group.leave()
            semaphor.signal() // +1
        }
        group.enter()
        semaphor.wait() // -1
        DispatchQueue.global().async {
            sleep(3)
            self.value = 40
            print(self.value, 3)
            group.leave()
            semaphor.signal() // +1
        }
        group.enter()
        semaphor.wait() // -1
        DispatchQueue.global().async {
            sleep(3)
            self.value = 50
            print(self.value, 4)
            group.leave()
            semaphor.signal() // +1
        }
        group.notify(queue: .main, execute: {
            print("Done")
        })
    }
}

// MARK: - UI
extension DispatchQueueViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        
    }
    final private func setLayout() {
        
    }
}
