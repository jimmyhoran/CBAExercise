//
//  AccountDetailsService.swift
//  CBAExercise
//
//  Created by James Horan on 9/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import Foundation

// Provides account data
class AccountDetailsService {
	
	func loadAccountDetails() -> AccountDetails? {
		let jsonData = loadData()
		if let jsonData = jsonData {
			return decode(data: jsonData)
		}
		return nil
	}
	
	// Load data from local JSON file
	private func loadData() -> Data? {
		if let path = Bundle.main.path(forResource: "exercise", ofType: "json") {
			do {
				return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
			} catch {
				print(error)
			}
		}
		return nil
	}
	
	// Decode JSON to AccountDetails
	private func decode(data: Data) -> AccountDetails? {
		do {
			return try JSONDecoder().decode(AccountDetails.self, from: data)
		} catch {
			print(error) // print any decoding errors
			return nil
		}
	}
}
