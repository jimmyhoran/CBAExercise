//
//  AccountDetailsViewData.swift
//  CBAExercise
//
//  Created by James Horan on 9/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import Foundation

struct AccountDetailsViewData {
	
	struct TransactionGroup {
		let date: Date
		let transactions: [TransactionViewData]
		
		init (date: Date, transactions: [TransactionViewData]) {
			self.date = date
			self.transactions = transactions
		}
	}
	
	private let accountDetails: AccountDetails?
	
	let accountInformation: AccountInformationViewData?
	var groupedTransactions: [TransactionGroup] = []
	
	init (accountDetails: AccountDetails?) {
		self.accountDetails = accountDetails
		
		if let accountDetails = accountDetails {
			self.accountInformation = AccountInformationViewData(account: accountDetails.account)
			self.groupedTransactions = groupByDate(transactions: mergeTransactionViewData(completed: mapToViewData(accountTransactions: accountDetails.transactions, pending: false),
																						  pending: mapToViewData(accountTransactions: accountDetails.pending, pending: true)))
		} else {
			self.accountInformation = nil
		}
	}
	
	private func groupByDate(transactions: [TransactionViewData]?) -> [TransactionGroup] {
		if let transactions = transactions {
			let dates = Set(transactions.map { $0.date })
			return dates.map { (date: Date) in
				return TransactionGroup(date: date, transactions: transactions.filter { date == $0.date })
				}.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
		}
		return []
	}
	
	private func mergeTransactionViewData(completed: [TransactionViewData]?, pending: [TransactionViewData]?) -> [TransactionViewData]? {
		if let pending = pending, let completed = completed {
			return pending + completed
		} else if let pending = pending {
			return pending
		} else if let completed = completed {
			return completed
		}
		return nil
	}
	
	// Maps account transactions to transaction view data
	private func mapToViewData(accountTransactions: [Transaction]?, pending: Bool) -> [TransactionViewData]? {
		if let accountTransactions = accountTransactions {
			return accountTransactions.map { TransactionViewData(description: $0.description, amount: $0.amount, date: $0.effectiveDate, atm: atm(for: $0.atmId), isPending: pending) }
		}
		return nil
	}
	
	private func atm(for id: String?) -> ATM? {
		if let atmId = id {
			return self.accountDetails?.atms?.filter { $0.id == atmId }.first
		}
		return nil
	}
}
