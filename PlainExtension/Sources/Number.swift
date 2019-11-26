//
//  Number.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/26/19.
//  
//

public extension FixedWidthInteger {
    
    /// Quick converter Int to CGFloat with .f notation.
    ///
    /// Use 0.f instead of CGFloat(0).
    var f: CGFloat {
        return CGFloat(self)
    }
}
