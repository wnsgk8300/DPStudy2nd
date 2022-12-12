////
////  TddLoginValidatorTest.swift
////  DPStudy_UIKitTests
////
////  Created by JEON JUNHA on 2022/11/21.
////
//
//import XCTest
//@testable import DPStudy_UIKitUITests
//
//final class TddLoginValidatorTest: XCTestCase {
//    
//    var validator: TddLoginValidator!
//
//    override func setUpWithError() throws {
//        validator = TddLoginValidator()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        validator = nil
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//    
//    func testLoginValidator_whenValidIdProvided_shouldReturnTrue() {
//        measure {
//            let user = TddUser(id: "Ad", pw: "Admin")
//            let isValidId = validator.isValid(id: user.id)
//            XCTAssertTrue(isValidId, "아이디는 4글자 이상이어야함")
//        }
//    }
//
//    // 샘플임
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
