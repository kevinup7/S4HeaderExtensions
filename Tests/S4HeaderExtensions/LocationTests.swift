@testable import S4HeaderExtensions

import XCTest
import S4

class LocationTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Location": ["http://www.example.net/index.html"]])
        XCTAssert(headers.location! == "http://www.example.net/index.html")
    }
}
