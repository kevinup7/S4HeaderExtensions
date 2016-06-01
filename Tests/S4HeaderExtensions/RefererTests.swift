@testable import S4HeaderExtensions

import XCTest
import S4

class RefererTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Referer": "http://www.example.org/hypertext/Overview.html"])
        XCTAssert(headers.referer! == "http://www.example.org/hypertext/Overview.html")
    }
}
