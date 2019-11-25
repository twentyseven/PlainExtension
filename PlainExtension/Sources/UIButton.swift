//
//  UIButton.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//
//

import Foundation

public extension UIButton {
    static func custom() -> UIButton {
        return UIButton(type: .custom)
    }
    
    func set(title: String, color: UIColor, font: UIFont? = nil, state: UIControl.State) {
        setTitle(title, for: state)
        setTitleColor(color, for: state)
        titleLabel?.font = font
        self.backgroundColor = backgroundColor
    }
}
