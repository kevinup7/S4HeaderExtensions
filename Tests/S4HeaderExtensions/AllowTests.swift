@testable import S4HeaderExtensions

import XCTest
import S4

class AllowTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Allow": "GET"])
        XCTAssert(headers.allow! == [.get])
    }

    func testMultiple() {
        let headers = Headers(["Allow": "GET,POST"])
        XCTAssert(headers.allow! == [.get, .post])
    }
}
