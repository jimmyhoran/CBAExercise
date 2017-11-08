//
//  UITableViewExtension.swift
//  CBAExercise
//
//  Created by James Horan on 2/11/17.
//  Copyright © 2017 James Horan. All rights reserved.
//

import UIKit

extension UITableView {
	
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
	
	func dequeueReusableHeader<T: UITableViewCell>() -> T where T: ReusableView {
		guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
			fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
		}
		
		return cell
	}
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
