@testable import S4HeaderExtensions

import XCTest
import S4

class UpgradeTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Upgrade": "websocket"])
        XCTAssert(headers.upgrade! == [UpgradeProtocol(name: "websocket")])
    }

    func testMultiple() {
        let headers = Headers(["Upgrade": "HTTP/2.0,SHTTP/1.3"])
        let values = [UpgradeProtocol(name: "HTTP", version: "2.0"), UpgradeProtocol(name: "SHTTP", version: "1.3")]
        XCTAssert(headers.upgrade! == values)
    }
}
