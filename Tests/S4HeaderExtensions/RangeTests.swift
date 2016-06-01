@testable import S4HeaderExtensions

import XCTest
import S4

class RangeTests: XCTestCase {

    func testBytesType() {
        let headers = Headers(["Range": "bytes=42-1233"])
        let range = RangeType.bytes([.between(42, 1233)])
        XCTAssert(headers.range! == range)
    }

    func testMultipleBytesType() {
        let headers = Headers(["Range": "bytes=42-1233,-1024"])
        let range = RangeType.bytes([.between(42, 1233), .last(1024)])
        XCTAssert(headers.range! == range)
    }

    func testCustomType() {
        let headers = Headers(["Range": "foo=bar"])
        let range = RangeType.custom(unit: "foo", value: "bar")
        XCTAssert(headers.range! == range)
    }

    func testRangeType() {
        XCTAssertNil(RangeType(headerValue: "42-1233"))
        XCTAssertNil(RangeType(headerValue: "foo"))
        XCTAssertNil(RangeType(headerValue: "foo bar"))
    }

    func testBytesRange() {
        XCTAssert(BytesRange(headerValue: "42-1233") == BytesRange.between(42, 1233))
        XCTAssert(BytesRange(headerValue: "-1024") == BytesRange.last(1024))
        XCTAssert(BytesRange(headerValue: "1024-") == BytesRange.startingAt(1024))

        XCTAssertNil(BytesRange(headerValue: "42 - 1233"))
        XCTAssertNil(BytesRange(headerValue: "- 1024"))
        XCTAssertNil(BytesRange(headerValue: "1024 -"))
    }
}
