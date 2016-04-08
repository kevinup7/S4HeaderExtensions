@testable import S4HeaderExtensions

import XCTest
import S4

class EncodingTests: XCTestCase {

    func testStringInitialization() {
        XCTAssert(Encoding.chunked == Encoding(headerValue: "chunked")!)
        XCTAssert(Encoding.compress == Encoding(headerValue: "compress")!)
        XCTAssert(Encoding.deflate == Encoding(headerValue: "deflate")!)
        XCTAssert(Encoding.gzip == Encoding(headerValue: "gzip")!)
        XCTAssert(Encoding.identity == Encoding(headerValue: "identity")!)
        XCTAssert(Encoding.custom("custom") == Encoding(headerValue: "custom")!)
    }
}
