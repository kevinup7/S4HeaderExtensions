@testable import S4HeaderExtensions

import XCTest
import S4

class HostTests: XCTestCase {

    func testHost() {
        let headers = Headers(["Host": "www.example.org"])
        XCTAssert(headers.host!.host == URI(host: "www.example.org").host)
    }

    func testPort() {
        let headers = Headers(["Host": "www.example.org:8080"])
        let uri = URI(host: "www.example.org", port: 8080)
        XCTAssert(headers.host!.host == uri.host && headers.host!.port == uri.port)
    }
}
