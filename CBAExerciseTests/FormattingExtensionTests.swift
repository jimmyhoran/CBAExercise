//
//  FormattingExtensionTests.swift
//  CBAExerciseTests
//
//  Created by James Horan on 9/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import XCTest
@testable import CBAExercise

class FormattingExtensionTests: XCTestCase {
	
	// Tests the double extension to format positive and negative values to string
	func testPositiveDoubleFormatting() {
		let value: Double = 10.20
		let expected = "$10.20"
		XCTAssertEqual(expected, value.dollarString)
	}
	
	func testNegativeDoubleFormatting() {
		let value: Double = -223.8022
		let expected = "-$223.80"
		XCTAssertEqual(expected, value.dollarString)
	}
}
