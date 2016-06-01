@testable import S4HeaderExtensions

import XCTest
import S4

class AcceptEncodingTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Accept-Encoding": "compress"])
        XCTAssert(headers.acceptEncoding! == [QualityValue(value: .compress)])
        XCTAssert(headers.acceptEncoding! != [QualityValue(value: .gzip)])
    }

    func testMultiple() {
        let headers = Headers(["Accept-Encoding": "compress,gzip;q=0.8"])
        let charSet1 = QualityValue<Encoding>(value: .compress)
        let charSet2 = QualityValue<Encoding>(value: .gzip, quality: 800)
        XCTAssert(headers.acceptEncoding! == [charSet1, charSet2])
    }
}
