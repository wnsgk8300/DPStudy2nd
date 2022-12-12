//
//  TddLoginFlowUITest.swift
//  DPStudy_UIKitUITests
//
//  Created by JEON JUNHA on 2022/11/21.
//

import XCTest

final class TddLoginFlowUITest: XCTestCase {
    
    private var app: XCUIApplication!
    private var idTextField: XCUIElement!
    private var pwTextField: XCUIElement!
    private var loginButton: XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app = XCUIApplication()
        app.launch()
        idTextField = app.textFields["idTextField"]
        pwTextField = app.textFields["pwTextField"]
        loginButton = app.buttons["loginButton"]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // 앞에 test를 붙여야 왼쪽에 다이아가 생김
    func testLoginSuccess() throws {
        app = XCUIApplication()
        app.textFields["idTextField"].tap()
        app.textFields["idTextField"].typeText("Admin")
        app.textFields["pwTextField"].tap()
        app.textFields["pwTextField"].typeText("Admin")
        loginButton.tap()
    }
    // 아래에 record 버튼 눌러서 자동완성도 가능하다
    // 수정은 많이 필요하다
    func testAuto() {
        
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
