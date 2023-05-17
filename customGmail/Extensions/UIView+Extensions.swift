//
//  UIView+Extensions.swift
//  customGmail
//
//  Created by Edgar Grigoryan on 17.05.23.
//

import UIKit

extension UIView {
    @discardableResult
    func add<T: UIView>(_ subview: T, then closure: (T) -> Void) -> T {
        addSubview(subview)
        closure(subview)
        return subview
    }
}
