//
//  AccountDetailsModel.swift
//  CBAExercise
//
//  Created by James Horan on 2/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import Foundation

struct AccountDetails: Decodable {
    var account: Account
    var transactions: [Transaction]?
    var pending: [Transaction]?
    var atms: [ATM]?
}

// Decode the account JSON object to a struct
struct Account: Decodable {
	var accountName: String
	var accountNumber: String
	var available: Double // Available funds
	var balance: Double // Account balance
}

// Decode a transaction and pending transaction JSON object to struct
struct Transaction: Decodable {
	var id: String
	var description: String
	var effectiveDate: String
	var amount: Double // Amount can be a negative number
	var atmId: String?
}

// Decode a JSON atm object
struct ATM: Decodable {
	var id: String
	var name: String
	var address: String
	var location: Location
	
	// Decode a geo location JSON object
	struct Location: Decodable  {
		var lat: Double
		var lng: Double
	}
}
