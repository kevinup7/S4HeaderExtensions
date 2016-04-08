@testable import S4HeaderExtensions

import XCTest
import S4

class AcceptLanguageTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Accept-Language": ["en"]])
        XCTAssert(headers.acceptLanguage! == [QualityValue(value: "en")])
        XCTAssert(headers.acceptLanguage! != [QualityValue(value: "en-gb")])
    }

    func testMultiple() {
        let headers = Headers(["Accept-Language": ["da", "en-gb;q=0.8"]])
        let language1 = QualityValue(value: "da")
        let language2 = QualityValue(value: "en-gb", quality: 800)
        XCTAssert(headers.acceptLanguage! == [language1, language2])
    }
}
