@testable import S4HeaderExtensions

import XCTest
import S4

class TETests: XCTestCase {

    func testSingle() {
        let headers = Headers(["TE": "trailers,deflate;q=0.5"])
        let te = [QualityValue<Encoding>(value: .custom("trailers")), QualityValue<Encoding>(value: .deflate, quality: 500)]
        XCTAssert(headers.te! == te)
    }

    func testMultiple() {
        let headers = Headers(["TE": "deflate;q=0.5"])
        let te = [QualityValue<Encoding>(value: .deflate, quality: 500)]
        XCTAssert(headers.te! == te)
    }
}
