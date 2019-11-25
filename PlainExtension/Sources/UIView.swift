//
//  UIView.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//  
//

import Foundation

public extension UIView {
    convenience init(backgroundColor: UIColor? = nil) {
        self.init()
        self.backgroundColor = backgroundColor
    }
    
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    // MARK: - Auto Layout
    
    func fillInSuperView(inset: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: inset.left).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1, constant: -inset.right).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: inset.top).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: -inset.bottom).isActive = true
    }
}
