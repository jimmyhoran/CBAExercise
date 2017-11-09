//
//  AccountDetailsTableViewController.swift
//  CBAExercise
//
//  Created by James Horan on 9/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

final class AccountDetailsTableViewController: UITableViewController {
	
	private let viewData = AccountDetailsViewData(accountDetails: AccountDetailsService().loadAccountDetails())
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Account Details"
		
		configureTableView()
	}
}

// MARK: - Table view data source
extension AccountDetailsTableViewController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		// Offset the count by 1 to include the account information section in the returned number of sections
		return viewData.groupedTransactions.count + 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if (section == 0) {
			return 1
		}
		return viewData.groupedTransactions[section - 1].transactions.count
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if section != 0 {
			let headerCell = tableView.dequeueReusableHeader() as TransactionTableViewHeaderView
			headerCell.configure(with: viewData.groupedTransactions[section - 1].date)
			return headerCell
		}
		return nil
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if (indexPath.section == 0) {
			let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as AccountInformationTableViewCell
			if let accountInformation = viewData.accountInformation {
				cell.configure(viewData: accountInformation)
			}
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TransactionTableViewCell
			cell.configure(viewData: viewData.groupedTransactions[indexPath.section - 1].transactions[indexPath.row])
			return cell
		}
	}
}

// MARK: - Table view delegate
extension AccountDetailsTableViewController {
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section == 0 {
			return 260
		}
		return 90
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if section == 0 {
			return 0
		}
		return 40
	}
}

// MARK: - Configure table view
extension AccountDetailsTableViewController {
	
	func configureTableView() {
		tableView.register(AccountInformationTableViewCell.self)
		tableView.register(TransactionTableViewHeaderView.self)
		tableView.register(TransactionTableViewCell.self)
		
		tableView.estimatedRowHeight = 280
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.allowsSelection = false
	}
}
