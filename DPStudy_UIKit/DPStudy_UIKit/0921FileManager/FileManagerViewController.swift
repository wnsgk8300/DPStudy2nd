//
//  FileManagerViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/21.
//

import UIKit

import UIKit

class FileManagerViewController: UIViewController {
    
    let saveButton = UIButton()
    let loadButton = UIButton()
    
    let fileManager = FileManager.default

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @objc
    func didTapSaveButton(_ sender: UIButton) {
//        save()
        save1()
    }
    
    @objc
    func didTapLoadButton(_ sender: UIButton) {
//        load()
        load1()
    }
}

extension FileManagerViewController {
    
    func save() {
        var isDirectory: ObjCBool = true
        if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirectory) {
            let someString = "Hello World"
            do {
                try someString.write(to: getMyAppFilePath(), atomically: true, encoding: .utf8)
                print("파일 쓰기 성공")
            } catch {
                print("파일 쓰기 실패: \(error)")
            }
        } else {
            do {
                try fileManager.createDirectory(atPath: getMyAppDirectoryPath().path, withIntermediateDirectories: false)
                print("폴더 생성 완료")
            } catch {
                print("폴더 생성 실패: \(error)")
            }
        }
    }
    
    func load() {
        do {
            let someThing = try String(contentsOf: getMyAppFilePath())
            print(someThing)
        } catch {
            print("파일 로드 에러: \(error)")
        }
    }
}

extension FileManagerViewController {
    
    func save1() {
        var isDirectory: ObjCBool = true
        if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirectory) {
            let person = Person(name: "ABC", age: "111")
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: person, requiringSecureCoding: false)
                do {
                    try data.write(to: getMyAppFilePath())
                    print("파일 쓰기 성공")
                } catch {
                    print("파일 쓰기 에러: \(error)")
                }
            } catch {
                print("아카이브 에러:  \(error)")
            }
        } else {
            do {
                try fileManager.createDirectory(atPath: getMyAppDirectoryPath().path, withIntermediateDirectories: false)
                print("폴더 생성 완료")
            } catch {
                print("폴더 생성 실패: \(error)")
            }
        }
    }
    
    func load1() {
        do {
            let data = try Data(contentsOf: getMyAppFilePath())
            print(data)
            do {
                let person = try NSKeyedUnarchiver.unarchivedObject(ofClass: Person.self, from: data)
                print("성공쓰 ", person?.name, person?.age)
            } catch {
                print("Unarchive 에러: \(error)")
            }
        } catch {
            print("파일 로드 에러: \(error)")
        }
    }
}

extension FileManagerViewController {
    
    func getDocumentDirectoryPath() -> URL {
        let documentDirectoryPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectoryPath
    }
    
    func getMyAppDirectoryPath() -> URL {
        let documentDirectoryPath = getDocumentDirectoryPath()
        let myAppDirectoryPath = documentDirectoryPath.appendingPathComponent("My App", isDirectory: true)
        return myAppDirectoryPath
    }
    
    func getMyAppFilePath() -> URL {
        let myAppDirectoryPath = getMyAppDirectoryPath()
        let filePath = myAppDirectoryPath.appendingPathComponent("Test.txt")
        return filePath
    }
}

// MARK: - UI
extension FileManagerViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        saveButton.setTitle("save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        loadButton.setTitle("load", for: .normal)
        loadButton.setTitleColor(.black, for: .normal)
        
        saveButton.addTarget(self, action: #selector(didTapSaveButton(_:)), for: .touchUpInside)
        loadButton.addTarget(self, action: #selector(didTapLoadButton(_:)), for: .touchUpInside)
    }
    final private func setLayout() {
        view.addSubview(saveButton)
        view.addSubview(loadButton)
        saveButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        loadButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(saveButton.snp.centerY).offset(30)
        }
    }
}

class Person: NSObject, NSCoding, NSSecureCoding {
    
    static var supportsSecureCoding: Bool = true
    
    let name: String
    let age: String
    
    // 인코딩
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
    }
    // 디코딩
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let age = coder.decodeObject(forKey: "age") as! String
        self.init(name: name, age: age)
    }
    
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}
