//
//  ReusableView.swift
//  CBAExercise
//
//  Created by James Horan on 6/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView {
	
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UITableViewCell: ReusableView { }
