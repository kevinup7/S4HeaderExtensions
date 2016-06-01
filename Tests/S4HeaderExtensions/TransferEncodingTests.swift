@testable import S4HeaderExtensions

import XCTest
import S4

class TransferEncodingTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Transfer-Encoding": "gzip"])
        XCTAssert(headers.transferEncoding! == [.gzip])
    }

    func testMultiple() {
        let headers = Headers(["Transfer-Encoding": "gzip,chunked"])
        XCTAssert(headers.transferEncoding! == [.gzip, .chunked])
    }
}
