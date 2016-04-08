@testable import S4HeaderExtensions

import XCTest
import S4

class ETagTests: XCTestCase {
    
    func testHeadersETagProperty() {
        let weak = Headers(["ETag": ["W/\"fklaj8093jpaf09djs0a9js\""]])
        let strong = Headers(["ETag": ["\"fklaj8093jpaf09djs0a9js\""]])

        XCTAssert(weak.eTag == EntityTag(tag: "fklaj8093jpaf09djs0a9js", weak: true))
        XCTAssert(weak.eTag != EntityTag(tag: "fklaj8093jpaf09djs0a9js"))

        XCTAssert(strong.eTag == EntityTag(tag: "fklaj8093jpaf09djs0a9js"))
        XCTAssert(strong.eTag != EntityTag(tag: "fklaj8093jpaf09djs0a9js", weak: true))
    }
}
