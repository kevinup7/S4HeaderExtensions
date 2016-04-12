@testable import S4HeaderExtensions

import XCTest
import S4

class ViaTests: XCTestCase {

    func testSingle() {
        let via = ViaHeader(protocolName: "HTTP", protocolVersion: "1.0", receivedBy: "fred")

        var headers = Headers([:])
        headers.via = [via]
        XCTAssert(headers.via! == [via])
    }

    func testMultiple() {
        let via = ViaHeader(protocolName: "HTTP", protocolVersion: "1.0", receivedBy: "fred")
        let via2 = ViaHeader(protocolName: "HTTP", protocolVersion: "1.1", receivedBy: "nowhere.com", comment: "(Apache/1.1)")

        var headers = Headers([:])
        headers.via = [via, via2]
        XCTAssert(headers.via! == [via, via2])
    }

    func testStringRepresentation() {
        let via = ViaHeader(protocolName: "HTTP", protocolVersion: "1.0", receivedBy: "fred")
        let via2 = ViaHeader(protocolName: "HTTP", protocolVersion: "1.1", receivedBy: "nowhere.com", comment: "(Apache/1.1)")

        let headers = ViaHeader.values(fromHeader: ["1.0 fred", "1.1 nowhere.com (Apache/1.1)"])!

        XCTAssert(headers == [via, via2])
    }
}
