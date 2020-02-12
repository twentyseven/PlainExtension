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
    
    /// Adds all views from array to the end of receiver's list of subviews.
    /// - Parameter subviews: List of views.
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func hug(_ items: (axis: NSLayoutConstraint.Axis, priority: UILayoutPriority)...) {
        items.forEach { (item) in
            self.setContentHuggingPriority(item.priority, for: item.axis)
        }
    }

    func expand(_ items: (axis: NSLayoutConstraint.Axis, priority: UILayoutPriority)...) {
        items.forEach { (item) in
            self.setContentCompressionResistancePriority(item.priority, for: item.axis)
        }
    }
}

// MARK: - Auto Layout
public extension UIView {
    func fillInSuperView(inset: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: inset.left).active()
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1, constant: -inset.right).active()
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: inset.top).active()
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: -inset.bottom).active()
    }
    
    func centerInSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0).active()
        NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0).active()
    }
    
    func centerXInSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0).active()

    }

    func centerYInSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0).active()
    }

}
