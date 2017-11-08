//
//  AppBrand.swift
//  CBAExercise
//
//  Created by James Horan on 6/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

struct Brand {

	struct Color {
		static let yellow = UIColor(red: 255.0 / 255.0, green: 204.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
		static let greenBackground = UIColor(red: 146.0 / 255.0, green: 176.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0)
		static let blackText = UIColor(red: 35.0 / 255.0, green: 31.0 / 255.0, blue: 32.0 / 255.0, alpha: 1.0)
		static let greyText = UIColor(red: 138.0 / 255.0, green: 138.0 / 255.0, blue: 138.0 / 255.0, alpha: 1.0)
		static let greyBackground = UIColor(red: 246.0 / 255.0, green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
	}
	
	struct Font {
		static let light18 = UIFont(name: "HelveticaNeue-Light", size: 18)
		static let light15 = UIFont(name: "HelveticaNeue-Light", size: 15)
		static let normal15 = UIFont(name: "HelveticaNeue-Medium", size: 15)
		static let bold15 = UIFont(name: "HelveticaNeue-Bold", size: 15)
	}
}
