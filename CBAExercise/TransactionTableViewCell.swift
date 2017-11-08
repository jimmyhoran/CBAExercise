//
//  TransactionTableViewCell.swift
//  CBAExercise
//
//  Created by James Horan on 2/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

// Transaction table view cell data
struct TransactionViewData {
	let description: String
	let amount: Double
	let date: Date
	let atm: ATM?
	let isPending: Bool
	
	init(description: String, amount: Double, date: String, atm: ATM?, isPending: Bool) {
		self.description = description
		self.amount = amount
		self.date = Date().formatDate(from: date) ?? Date()
		self.atm = atm
		self.isPending = isPending
	}
}

// Transaction table view
class TransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationImageView: UIImageView! // Hidden at the view level based on transaction type
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
	@IBOutlet weak var descriptionLabelLeadingConstraint: NSLayoutConstraint!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		locationImageView.isHidden = false
		descriptionLabel.textColor = Brand.Color.blackText
		amountLabel.textColor = Brand.Color.blackText
		
		descriptionLabel.font = Brand.Font.normal15
		amountLabel.font = Brand.Font.bold15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	// Congfigure view by binding view data
	func configure(viewData: TransactionViewData) {
		locationImageView.isHidden = (viewData.atm == nil) ? true : false
		descriptionLabelLeadingConstraint.constant = (viewData.atm == nil) ? 20 : 60
		descriptionLabel.attributedText = viewData.isPending ? "<b>PENDING:</b> \(viewData.description)".applyFont().htmlToAttributedString : viewData.description.applyFont().htmlToAttributedString
		amountLabel.text = viewData.amount.dollarString
    }
}
