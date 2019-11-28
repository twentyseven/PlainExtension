//
//  UIPageViewController.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/26/19.
//  
//

public extension UIPageViewController {
    var scrollView: UIScrollView? {
        for subview in view.subviews {
            if let scrollView = subview as? UIScrollView {
                return scrollView
            }
        }
        return nil
    }
}
