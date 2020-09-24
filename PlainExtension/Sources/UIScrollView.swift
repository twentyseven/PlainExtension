//
//  UIScrollView.swift
//  abseil
//
//  Created by Trong Bui Tuan on 9/8/20.
//
//

import Foundation

public extension UIScrollView {
    var offsetFrame: CGRect {
        return CGRect(x: -contentInset.left, y: -contentInset.top,
                      width: max(0, contentSize.width - bounds.width + contentInset.right + contentInset.left),
                      height: max(0, contentSize.height - bounds.height + contentInset.bottom + contentInset.top))
    }

    func scrollTo(edge: UIRectEdge, animated: Bool) {
        let target: CGPoint
        switch edge {
        case UIRectEdge.top:
            target = CGPoint(x: contentOffset.x, y: offsetFrame.minY)
        case UIRectEdge.bottom:
            target = CGPoint(x: contentOffset.x, y: offsetFrame.maxY)
        case UIRectEdge.left:
            target = CGPoint(x: offsetFrame.minX, y: contentOffset.y)
        case UIRectEdge.right:
            target = CGPoint(x: offsetFrame.maxX, y: contentOffset.y)
        default:
            return
        }
        setContentOffset(target, animated: animated)
    }
}
