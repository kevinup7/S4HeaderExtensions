@testable import S4HeaderExtensions

import XCTest
import S4

class ContentRangeTests: XCTestCase {

    func testBytesType() {
        let headers = Headers(["Content-Range": ["bytes 42-1233/1234"]])
        let range = ContentRangeType.bytes(ContentRange(range: 42 ..< 1233, totalLength: 1234))
        XCTAssert(headers.contentRange! == range)
    }

    func testCustomType() {
        let headers = Headers(["Content-Range": ["foo bar"]])
        let range = ContentRangeType.custom(unit: "foo", value: "bar")
        XCTAssert(headers.contentRange! == range)
    }

    func testContentRangeType() {
        XCTAssertNil(ContentRangeType(headerValue: "bytes42-1233/1234"))
        XCTAssertNil(ContentRangeType(headerValue: "42-1233/1234"))
        XCTAssertNil(ContentRangeType(headerValue: "foo/bar"))
        XCTAssertNil(ContentRangeType(headerValue: "foo"))
        XCTAssertNil(ContentRangeType(headerValue: "foo "))
    }

    func testContentRange() {
        XCTAssert(ContentRange(headerValue: "42-1233/1234")! == ContentRange(range: 42 ..< 1233, totalLength: 1234))
        XCTAssert(ContentRange(headerValue: "*/1234")! == ContentRange(range: nil, totalLength: 1234))
        XCTAssert(ContentRange(headerValue: "42-1233/*")! == ContentRange(range: 42 ..< 1233, totalLength: nil))

        XCTAssertNil(ContentRange(headerValue: "42 - 1233/1234"))
        XCTAssertNil(ContentRange(headerValue: "42-1233 / 1234"))
    }
}
