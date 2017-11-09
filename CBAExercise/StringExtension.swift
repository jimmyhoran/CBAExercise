//
//  StringExtension.swift
//  CBAExercise
//
//  Created by James Horan on 7/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

extension String {
	
	// Append styling tags to a HTML string
	func appedHTMLFontStyles() -> String {
		return String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: 15\">%@</span>", self)
	}
	
	// Convert HTML string to attributed string
	var htmlToAttributedString: NSAttributedString? {
		do {
			return try NSAttributedString(data: Data(utf8),
										  options: [.documentType: NSAttributedString.DocumentType.html,
													.characterEncoding: String.Encoding.utf8.rawValue],
										  documentAttributes: nil)
		} catch {
			print("error:", error)
			return  nil
		}
	}
}
