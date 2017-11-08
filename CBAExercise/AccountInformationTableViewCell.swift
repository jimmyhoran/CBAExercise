//
//  AccountInformationTableViewCell.swift
//  CBAExercise
//
//  Created by James Horan on 2/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

struct AccountInformationViewData {
	let accountName: String
	let accountNumber: String
	let availableFunds: Double
	let accountBalance: Double
	
	init(account: Account) {
		self.accountName = account.accountName
		self.accountNumber = account.accountNumber
		self.availableFunds = account.available
		self.accountBalance = account.balance
	}
}

class AccountInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
	@IBOutlet weak var availableFundsTitle: UILabel!
    @IBOutlet weak var availableFundsLabel: UILabel!
	@IBOutlet weak var accountBalanceTitle: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
		
		// Set brand colours to the view
		accountNameLabel.textColor = Brand.Color.blackText
		accountNumberLabel.textColor = Brand.Color.greyText
		availableFundsTitle.textColor = Brand.Color.greyText
		availableFundsLabel.textColor = Brand.Color.blackText
		accountBalanceTitle.textColor = Brand.Color.greyText
		accountBalanceLabel.textColor = Brand.Color.greyText

		// Set the font for the views dynamic items
		accountNameLabel.font = Brand.Font.light18
		accountNumberLabel.font = Brand.Font.normal15
		availableFundsTitle.font = Brand.Font.light15
		availableFundsLabel.font = Brand.Font.bold15
		accountBalanceTitle.font = Brand.Font.light15
		accountBalanceLabel.font = Brand.Font.bold15
    }
	
	// Congfigure view by binding view data
	func configure(viewData: AccountInformationViewData) {
		accountNameLabel.text = viewData.accountName
		accountNumberLabel.text = viewData.accountNumber
		availableFundsLabel.text = viewData.availableFunds.dollarString
		accountBalanceLabel.text = viewData.accountBalance.dollarString
    }
}
