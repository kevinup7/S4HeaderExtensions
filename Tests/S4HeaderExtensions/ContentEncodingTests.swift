@testable import S4HeaderExtensions

import XCTest
import S4

class ContentEncodingTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Content-Encoding": "gzip"])
        XCTAssert(headers.contentEncoding! == [.gzip])
    }

    func testMultiple() {
        let headers = Headers(["Content-Encoding": "gzip, chunked"])
        XCTAssert(headers.contentEncoding! == [.gzip, .chunked])
    }
}
