//
//  DateExtension.swift
//  CBAExercise
//
//  Created by James Horan on 2/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import Foundation

extension Date {
    
    // Returns day count from self to current date
    func dayCount() -> Int? {
        return Calendar.current.dateComponents([.day], from: self, to: Date()).day
    }
	
	func formattedDateString() -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy"
		return dateFormatter.string(from: self)
	}
    
    // Date object from a string using date format dd/MM/yyyy
    func formatDate(from dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: dateString)
    }
}
