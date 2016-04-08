@testable import S4HeaderExtensions

import XCTest
import S4

class FromTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["From": ["webmaster@example.org"]])
        XCTAssert(headers.from! == "webmaster@example.org")
    }
}
