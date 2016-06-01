@testable import S4HeaderExtensions

import XCTest
import S4

class AcceptCharsetTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Accept-Charset": "iso-8859-5"])
        XCTAssert(headers.acceptCharset! == [QualityValue(value: "iso-8859-5")])
        XCTAssert(headers.acceptCharset! != [QualityValue(value: "iso-8859-4")])
    }

    func testMultiple() {
        let headers = Headers(["Accept-Charset": "iso-8859-5,unicode-1-1;q=0.8"])
        let charSet1 = QualityValue(value: "iso-8859-5")
        let charSet2 = QualityValue(value: "unicode-1-1", quality: 800)
        XCTAssert(headers.acceptCharset! == [charSet1, charSet2])
    }
}
