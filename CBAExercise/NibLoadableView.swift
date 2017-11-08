//
//  NibLoadableView.swift
//  CBAExercise
//
//  Created by James Horan on 6/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
	
	static var nibName: String {
		return String(describing: self)
	}
}

extension UITableViewCell: NibLoadableView { }
