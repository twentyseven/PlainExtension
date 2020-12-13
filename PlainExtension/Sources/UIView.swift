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
    func addSubviews(_ subviews: UIView...) {
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
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: inset.top),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: inset.left),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset.bottom),
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -inset.right),
        ])
    }
    
    func fillInSuperViewSafeArea(inset: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: inset.top),
            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: inset.left),
            bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -inset.bottom),
            rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor, constant: -inset.right),
        ])
    }

    func centerX(to view: UIView? = nil, offset: CGFloat = 0) {
        let v = view ?? superview
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: v, attribute: .centerX, multiplier: 1, constant: offset).active()

    }

    func centerY(to view: UIView? = nil, offset: CGFloat = 0) {
        let v = view ?? superview
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: v, attribute: .centerY, multiplier: 1, constant: offset).active()
    }

    func center(to view: UIView? = nil, offset: CGPoint = .zero) {
        centerX(to: view, offset: offset.x)
        centerY(to: view, offset: offset.y)
    }
    
    func addConstraintsWithFormat(format: String, options: NSLayoutConstraint.FormatOptions = [], views: UIView...) {
        var viewsInfo = [String: UIView]()
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsInfo["v\(index)"] = view
        }
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: nil, views: viewsInfo))
    }
}
