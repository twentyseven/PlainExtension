//
//  UIImage.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//  
//

import Foundation

extension UIImage {
    static func image(from color: UIColor, size: CGSize = CGSize(width: 1, height: 1), isCircle: Bool = false) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        if isCircle {
            context?.fillEllipse(in: rect)
        } else {
            context?.fill(rect)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
