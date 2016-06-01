@testable import S4HeaderExtensions

import XCTest
import S4

class TrailerTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Trailer": "Date"])
        XCTAssert(headers.trailer! == ["Date"])
    }

    func testMultiple() {
        let headers = Headers(["Trailer": "Date,Expires"])
        XCTAssert(headers.trailer! == ["Date", "Expires"])
    }
}
