# S4 Header Extensions

A collection of extensions to [S4](https://github.com/SwiftX/S4) that provide strongly-typed headers for the most common HTTP headers. Inspired by [hyper](https://github.com/hyperium/hyper) for Rust.

## Examples

```swift
var body = "Hello, World!"
var response = Response(body: body)
response.headers.etag = EntityTag(tag: body.hash.description)
response.headers.cacheControl = [.maxAge(3600), .mustRevalidate]
```


## Current Headers

Request/Response Headers:
- Cache-Control
- Connection
- Date
- Pragma
- Trailer
- Transfer-Encoding
- Upgrade
- Via

Request Headers:
- Accept
- Accept-Charset
- Accept-Encoding
- Accept-Language
- Expect
- From
- Host
- If-Match
- If-Modified-Since
- If-None-Match
- If-Range
- If-Unmodified-Since
- Max-Forwards
- Range
- Referer
- TE
- User-Agent

Response Headers:
- Accept-Ranges
- Age
- ETag
- Location
- Retry-After
- Server
- Vary

Entity Headers:
- Allow
- Content-Encoding
- Content-Language
- Content-Length
- Content-Location
- Content-Range
- Expires
- Last-Modified

Not Yet Implemented:
- Authorization
- Content-Type
- Proxy-Authenticate
- Proxy-Authorization
- Warning
- WWW-Authenticate


## Adding New Headers

It's easy to add custom headers by extending `Headers`.

```swift
import S4

extension Headers {
    public var isMobile: Bool? {
        get {
            if let headerValue = headers["Is-Mobile"]?.first {
                if headerValue == "1" {
                    return true
                } else if headerValue == "0" {
                    return false
                } else {
                    return nil
                }
            }
            return nil
        }
        set {
            if let newValue = newValue {
                headers["Is-Mobile"] = newValue ? "1" : "0"
            } else {
                headers["Is-Mobile"] = nil
            }
        }
    }
}
```