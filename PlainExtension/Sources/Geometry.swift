//
//  Geometry.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 12/14/19.
//
//

public extension CGPoint {
    init(_ x: Int, _ y: Int) {
        self.init(x: x, y: y)
    }
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }

    init(_ x: Double, _ y: Double) {
        self.init(x: x, y: y)
    }
}

public extension CGSize {
    init(_ width: Int, _ height: Int) {
        self.init(width: width, height: height)
    }
    
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }

    init(_ width: Double, _ height: Double) {
        self.init(width: width, height: height)
    }
}

public extension CGRect {
    init(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    init(_ x: Double, _ y: Double, _ width: Double, _ height: Double) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin: origin, size: size)
    }
}

