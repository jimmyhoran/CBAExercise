//
//  DoubleExtension.swift
//  CBAExercise
//
//  Created by James Horan on 7/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import Foundation

extension Double {
	
	// Format double as dollar value string
	var dollarString: String {
		if self < 0 {
			return String(format: "-$%.2f", abs(self))
		} else {
			return String(format: "$%.2f", self)
		}
	}
}
