//
//  Accept.swift
//  ZewoHeaderExtensions
//
//  Created by Kevin Sullivan on 2/25/16.
//  Copyright © 2016 Kevin Sullivan. All rights reserved.
//

import S4


extension Headers {
	
	/**
		The `Accept` header field can be used by user agents to specify
		response media types that are acceptable. `Accept` header fields can
		be used to indicate that the request is specifically limited to a
		small set of desired types, as in the case of a request for an
		in-line image.
		
		The asterisk "*" character is used to group media types into ranges,
		with "\*\/\*" indicating all media types and "type\/\*" indicating all
		subtypes of that type.  The media-range can include media type
		parameters that are applicable to that range.
	
		## Example Headers
		Accept: audio\/\*; q=0.2, audio/basic
		Accept: text/plain; q=0.5, text/html, text/x-dvi; q=0.8, text/x-c
	
		## Examples
			var request =  Request()
			request.accept = [QualityValue(item: MediaType(string: "text/html"))]
	
			var request =  Request()
			request.accept = [
				QualityValue(item: MediaType(string: "text/html")),
				QualityValue(item: MediaType(string: "text/plain"), quality: 500)
			]
	
	
	- seealso: [RFC7231](http://tools.ietf.org/html/rfc7231#section-5.3.2)
	*/
	public var accept: [QualityValue<MIMEType>]? {
		get {
            return QualityValue<MIMEType>.values(fromHeader: headers["Allow"])
		}
		set {
			headers["Allow"] = newValue?.header
		}
	}
}