@testable import S4HeaderExtensions

import XCTest
import S4

class IfUnmodifiedSinceTests: XCTestCase {
	
	func testUnmodifiedSince() {
		let dateString = "Tue, 15 Nov 1994 08:12:31 GMT"
		let headers = Headers(["If-Unmodified-Since": [dateString]])
		XCTAssert(headers.ifUnmodifiedSince!.headerValue == dateString)
	}
}
