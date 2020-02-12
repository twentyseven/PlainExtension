//
//  Alert.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 2/12/20.
//  
//

public extension UIAlertController {
    static func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    static func showError(title: String? = "Error", _ error: Error?) {
        guard let error = error else { return }
        showAlert(title: title, message: error.localizedDescription)
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
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
