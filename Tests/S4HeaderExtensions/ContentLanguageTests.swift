@testable import S4HeaderExtensions

import XCTest
import S4

class ContentLanguageTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Content-Language": "da"])
        XCTAssert(headers.contentLanguage! == ["da"])
    }

    func testMultiple() {
        let headers = Headers(["Content-Language": "mi,en"])
        XCTAssert(headers.contentLanguage! == ["mi", "en"])
    }
}
