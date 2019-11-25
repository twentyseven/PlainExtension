//
//  UIImage.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//  
//

public extension UIImage {
    
    /// Generate UIImage from a color.
    ///
    /// Sample usecase is to create a resizable background image from a color for UIButton
    /// - Parameters:
    ///   - color: Color object to create image
    ///   - size: Expected image size. Default is a point.
    static func image(from color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
