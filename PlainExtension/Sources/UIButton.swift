//
//  UIButton.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//
//

public extension UIButton {
    static func custom(title: String? = nil, color: UIColor? = nil, font: UIFont? = nil) -> Self {
        let button = Self(type: .custom)
        button.set(title: title, color: color, font: font, state: .normal)
        return button
    }
    
    static func custom(_ image: UIImage? = nil) -> Self {
        let button = Self(type: .custom)
        button.setImage(image, for: .normal)
        return button
    }

    func set(title: String?, color: UIColor?, font: UIFont? = nil, state: UIControl.State) {
        setTitle(title, for: state)
        setTitleColor(color, for: state)
        if let font = font {
            titleLabel?.font = font
        }
    }
    
    func setBackgroundColor(color: UIColor?, for state: UIControl.State = .normal) {
        guard let color = color else {
            setBackgroundImage(nil, for: state)
            return
        }
        setBackgroundImage(UIImage.image(from: color)?.resizableImage(withCapInsets: .zero), for: state)
    }
    
    func setImage(_ image: UIImage?, for state: UIControl.State, tintColor: UIColor?) {
        setImage(image?.withRenderingMode(.alwaysTemplate), for: state)
        self.tintColor = tintColor
    }
    
    func setBackgroundImage(_ image: UIImage?, for state: UIControl.State, tintColor: UIColor?) {
        setBackgroundImage(image?.withRenderingMode(.alwaysTemplate), for: state)
        self.tintColor = tintColor
    }

}
