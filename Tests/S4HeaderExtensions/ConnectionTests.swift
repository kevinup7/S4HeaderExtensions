@testable import S4HeaderExtensions

import XCTest
import S4

class ConnectionTests: XCTestCase {

    func testStringInit() {
        XCTAssert(ConnectionType.close == ConnectionType(headerValue: "close"))
        XCTAssert(ConnectionType.keepAlive == ConnectionType(headerValue: "keep-alive"))
        XCTAssert(ConnectionType.connectionHeader("headerName") == ConnectionType(headerValue: "headerName"))
    }
    
    func testEquality() {
        XCTAssert(ConnectionType.close != ConnectionType.keepAlive)
        XCTAssert(ConnectionType.close != ConnectionType.connectionHeader("headerName"))
        XCTAssert(ConnectionType.keepAlive != ConnectionType.connectionHeader("headerName"))
    }
    
    func testHeadersProperty() {
        let headers = Headers(["Connection" : ["keep-alive"]])
        XCTAssert(headers.connection! == [ConnectionType.keepAlive])
    }
}
