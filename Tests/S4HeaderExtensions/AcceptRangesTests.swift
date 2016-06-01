@testable import S4HeaderExtensions

import XCTest
import S4

class AcceptRangesTests: XCTestCase {
    func testCreation() {
        XCTAssert(AcceptRanges.bytes == AcceptRanges(headerValue: "bytes")!)
        XCTAssert(AcceptRanges.none == AcceptRanges(headerValue: "none")!)
        XCTAssert(AcceptRanges.custom("foo") == AcceptRanges(headerValue: "foo")!)
    }

    func testHeaders() {
        let headers = Headers(["Accept-Ranges": "bytes"])
        XCTAssert(headers.acceptRanges! == .bytes)
    }
}
