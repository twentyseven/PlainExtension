//
//  UILabel.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 2/24/20.
//
//

import Foundation

public extension UILabel {
    convenience init(font: UIFont, textColor: UIColor) {
        self.init(frame: .zero)
        self.font = font
        self.textColor = textColor
    }

    func setText(_ text: String?) {
        self.text = text
    }
}
