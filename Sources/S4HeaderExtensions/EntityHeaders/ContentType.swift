import S4

extension Headers {
	
	/**
	The `Content-Type` header field indicates the media type of the
	associated representation: either the representation enclosed in the
	message payload or the selected representation, as determined by the
	message semantics.  The indicated media type defines both the data
	format and how that data is intended to be processed by a recipient,
	within the scope of the received message semantics, after any content
	codings indicated by `Content-Encoding` are decoded.
	
	## Example Headers
	`Content-Type: text/html; charset=ISO-8859-4`
	
	
	## Examples
		var response = Response()
		response.contentType = MIMEType(type: "text", subtype: "html", parameters: ["charset": "ISO-8859-4"])
	
	- seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-3.1.1.5)
	*/
	public var contentType: MIMEType? {
		get {
            return headers["Content-Type"].flatMap({ MIMEType(headerValue: $0) })
		}
		set {
			headers["Content-Type"] = newValue?.headerValue
		}
	}
}

