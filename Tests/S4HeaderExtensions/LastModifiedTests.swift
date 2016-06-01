@testable import S4HeaderExtensions

import XCTest
import S4

class LastModifiedTests: XCTestCase {
	
	func testLastModified() {
		let dateString = "Tue, 15 Nov 1994 08:12:31 GMT"
		let headers = Headers(["Last-Modified": dateString])
		XCTAssert(headers.lastModified!.headerValue == dateString)
	}
}
