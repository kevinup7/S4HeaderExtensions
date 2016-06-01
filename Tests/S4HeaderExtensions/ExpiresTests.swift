@testable import S4HeaderExtensions

import XCTest
import S4

class ExpiresTests: XCTestCase {
	
	func testExpires() {
		let dateString = "Tue, 15 Nov 1994 08:12:31 GMT"
		let headers = Headers(["Expires": dateString])
		XCTAssert(headers.expires!.headerValue == dateString)
	}
}
