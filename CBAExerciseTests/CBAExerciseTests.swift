//
//  CBAExerciseTests.swift
//  CBAExerciseTests
//
//  Created by James Horan on 2/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import XCTest
@testable import CBAExercise

class CBAExerciseTests: XCTestCase {
	
	let service = AccountDetailsService()
	
	// Test loading and decoding account details json file
	func testLoadingAndDecodingAccountDetails() {
		XCTAssertNotNil(service.loadAccountDetails())
	}
	
	// Test account details view data
	func testAccountDetailsViewData() {
		let viewData = AccountDetailsViewData(accountDetails: service.loadAccountDetails())
		XCTAssertNotNil(viewData)
		XCTAssertNotNil(viewData.accountInformation)
	}
	
	// Test we have the correct number of grouped transactions by date
	func testNumberOfTransactionsGroups() {
		let actualGroupCount = 13
		let groupedTransactions = AccountDetailsViewData(accountDetails: service.loadAccountDetails()).groupedTransactions
		XCTAssertEqual(actualGroupCount, groupedTransactions.count)
	}
	
	// Test for the correct number of transactions grouped in a section
	func testNumberOfTransactionsInGroup() {
		let actualTransactionsCountInGroup = 2
		let groupOfTransactions = AccountDetailsViewData(accountDetails: service.loadAccountDetails()).groupedTransactions[0].transactions
		XCTAssertEqual(actualTransactionsCountInGroup, groupOfTransactions.count)
	}
}
