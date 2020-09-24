//
//  Alert.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 2/12/20.
//
//

public extension UIAlertController {
    typealias BlankCompletionBlock = (() -> Void)
    private static var topVC: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController?.topMostViewController()
    }

    static func showAlert(title: String?, message: String?, action: BlankCompletionBlock? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                action?()
            }))
            topVC?.present(alert, animated: true, completion: nil)
        }
    }

    static func showError(title: String? = "Error", _ error: Error?, action: BlankCompletionBlock? = nil) {
        guard let error = error else { return }
        showAlert(title: title, message: error.localizedDescription, action: action)
    }

    static func showDebugError(title: String? = "Error", _ error: Error?) {
        #if DEBUG
            showError(title: "DEBUG: " + (title ?? "Error"), error)
        #endif
    }

    static func showAlert(title: String?, message: String?, actionTitles: [String?]? = nil, actions: [((UIAlertAction) -> Void)?]? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let actionTitles = actionTitles {
            for (idx, actionTitle) in actionTitles.enumerated() {
                let action = UIAlertAction(title: actionTitle, style: .default, handler: idx < actions?.count ?? 0 ? actions?[idx] : nil)
                alert.addAction(action)
            }
        }
        topVC?.present(alert, animated: true, completion: nil)
    }
}
