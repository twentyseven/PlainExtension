//
//  UIButton.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//
//

public extension UIButton {
    static func custom() -> UIButton {
        return UIButton(type: .custom)
    }
    
    func set(title: String?, color: UIColor?, font: UIFont? = nil, state: UIControl.State) {
        setTitle(title, for: state)
        setTitleColor(color, for: state)
        if let font = font {
            titleLabel?.font = font
        }
    }
    
    func setBackgroundColor(color: UIColor, for state: UIControl.State = .normal) {
        setBackgroundImage(UIImage.image(from: color)?.resizableImage(withCapInsets: .zero), for: state)
    }
}
