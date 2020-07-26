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
    /// Sample usecase is to create a resizable background image from a color for UIButton.
    /// - Parameters:
    ///   - color: Color object to create image.
    ///   - size: Expected image size. Default is a point.
    static func image(from color: UIColor?, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        guard let color = color else { return nil }
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func scaleImage(toSize newSize: CGSize) -> UIImage? {
        var newImage: UIImage?
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        if let context = UIGraphicsGetCurrentContext(), let cgImage = self.cgImage {
            context.interpolationQuality = .high
            let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
            context.concatenate(flipVertical)
            context.draw(cgImage, in: newRect)
            if let img = context.makeImage() {
                newImage = UIImage(cgImage: img)
            }
            UIGraphicsEndImageContext()
        }
        return newImage
    }
}
