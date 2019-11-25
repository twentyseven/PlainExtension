//
//  UILabel.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//  
//

import Foundation

extension UILabel {
    func textHeight(inWidth width: CGFloat) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.height(inWidth: width, font: font)
    }

    func attributedTextHeight(inWidth width: CGFloat) -> CGFloat {
        guard let attributedText = attributedText else {
            return 0
        }
        return attributedText.height(inWidth: width)
    }
}

extension String {
    func height(inWidth width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font : font], context: nil)
        return actualSize.height
    }
}

extension NSAttributedString {
    func height(inWidth width: CGFloat) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], context: nil)
        return actualSize.height
    }
}
