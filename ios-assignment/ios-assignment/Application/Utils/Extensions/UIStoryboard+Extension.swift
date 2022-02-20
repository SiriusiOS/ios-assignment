//
//  UIStoryboard+Extension.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
import UIKit
extension UIStoryboard {
    func controller<T: UIViewController>() -> T {
        guard let controller = self.instantiateViewController(withIdentifier: T.identify) as? T else {
            fatalError("\(T.identify) type do not exits")
        }
        
        return controller
    }
}
