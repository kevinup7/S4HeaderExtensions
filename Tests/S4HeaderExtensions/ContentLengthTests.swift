@testable import S4HeaderExtensions

import XCTest
import S4

class ContentLengthTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Content-Length": ["3600"]])
        XCTAssert(headers.contentLength! == 3600)
        XCTAssert(headers.contentLength! != 3601)
    }
}
