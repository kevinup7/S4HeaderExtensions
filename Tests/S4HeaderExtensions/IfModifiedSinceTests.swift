@testable import S4HeaderExtensions

import XCTest
import S4

class IfModifiedSinceTests: XCTestCase {
	
	func testIfModifiedSince() {
		let dateString = "Tue, 15 Nov 1994 08:12:31 GMT"
		let headers = Headers(["If-Modified-Since": [dateString]])
		XCTAssert(headers.ifModifiedSince!.headerValue == dateString)
	}
}
