@testable import S4HeaderExtensions

import XCTest
import S4

class ContentLocationTests: XCTestCase {

    func testContentLocation() {
        let headers = Headers(["Content-Location": "/index.htm"])
        XCTAssert(headers.contentLocation! == "/index.htm")
    }
}
