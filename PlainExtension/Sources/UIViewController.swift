//
//  UIViewController.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 02/10/20.
//
//

public extension UIViewController {
    func canPerformSegue(withIdentifier id: String) -> Bool {
        guard let segues = value(forKey: "storyboardSegueTemplates") as? [NSObject] else { return false }
        return segues.first { $0.value(forKey: "identifier") as? String == id } != nil
    }

    /// Performs segue with passed identifier, if self can perform it.
    func performSegueIfPossible(id: String?, sender: AnyObject? = nil) {
        guard let id = id, canPerformSegue(withIdentifier: id) else { return }
        performSegue(withIdentifier: id, sender: sender)
    }
    
    var topMostViewController: UIViewController? {
        if self.isKind(of: UITabBarController.self) {
            return (self as! UITabBarController).selectedViewController?.topMostViewController
        } else if self.isKind(of: UINavigationController.self) {
            return (self as! UINavigationController).visibleViewController?.topMostViewController
        } else if self.presentedViewController != nil {
            return self.presentedViewController?.topMostViewController
        }
        return self
    }
}
