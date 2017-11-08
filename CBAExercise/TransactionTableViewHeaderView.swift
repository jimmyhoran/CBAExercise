//
//  TransactionTableViewHeaderView.swift
//  CBAExercise
//
//  Created by James Horan on 6/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

// Header view used in grouping transactions by date
class TransactionTableViewHeaderView: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var daysElapsedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
		
		dateLabel.textColor = Brand.Color.blackText
		daysElapsedLabel.textColor = Brand.Color.blackText
		
		dateLabel.font = Brand.Font.normal15
		daysElapsedLabel.font = Brand.Font.normal15
		
		backgroundColor = Brand.Color.yellow
    }
    
    func configure(with date: Date) {
        dateLabel.text = dateAsFormattedString(from: date)
        if let dayCount = date.dayCount() {
            daysElapsedLabel.text = "\(dayCount) Days Ago"
        }
    }
    
    // Provides a formatted date e.g. 02 Sept 2017
    private func dateAsFormattedString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
}
