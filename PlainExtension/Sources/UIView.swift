//
//  UIView.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//  
//

public extension UIView {
    convenience init(backgroundColor: UIColor? = nil) {
        self.init()
        self.backgroundColor = backgroundColor
    }
    
    /// Adds all views from array to the end of receiver's list of subviews
    /// - Parameter subviews: List of views
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func hug(_ axises: [NSLayoutConstraint.Axis], priority: UILayoutPriority = .required) {
        axises.forEach { (axis) in
            self.setContentHuggingPriority(priority, for: axis)
        }
    }
    
    func expand(_ axises: [NSLayoutConstraint.Axis], priority: UILayoutPriority = .required) {
        axises.forEach { (axis) in
            self.setContentCompressionResistancePriority(priority, for: axis)
        }
    }
}


// MARK: - Auto Layout
public extension UIView {
    func fillInSuperView(inset: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: inset.left).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1, constant: -inset.right).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: inset.top).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: -inset.bottom).isActive = true
    }
}
