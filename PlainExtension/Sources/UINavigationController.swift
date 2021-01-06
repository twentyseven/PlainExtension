//
//  UINavigationController.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/26/19.
//
//

// MARK: - Navigation with completion

public extension UINavigationController {
    func pushToViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    func popViewController(animated: Bool, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    func popToViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    func popToRootViewController(animated: Bool, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToRootViewController(animated: animated)
        CATransaction.commit()
    }
}

// MARK: - Update navigation bar state

public extension UINavigationController {
    private static var savedStateKey = 0

    /// Associated object to store navigation bar state for restoring.
    private static var savedState: NavigationBarState? {
        get {
            return objc_getAssociatedObject(self, &Self.savedStateKey) as? NavigationBarState
        }
        set {
            objc_setAssociatedObject(self, &Self.savedStateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /// Save current navigation bar state to restore later with `restoreState()`
    func saveState() {
        Self.savedState = NavigationBarState(navigationBar)
    }

    /// Restore previous saved navigation bar state by `saveState()`.
    /// - Parameter animated: Default is `false`.
    func restoreState(animated: Bool = false) {
        if let state = Self.savedState {
            navigationBar.applyState(state, animated: animated)
            Self.savedState = nil
        }
    }
}

public extension UINavigationBar {
    /// Update navigation transparent style with option to save current state for restoring.
    /// - Parameters:
    ///   - transparent: Specify `true` for completely transparent bar. Default is `true`.
    ///   - animated: Default is `false`.
    func makeTransparent(_ transparent: Bool = true, animated: Bool = false) {
        animate(duration: animated ? 0.33 : 0) {
            setBackgroundImage(transparent ? UIImage() : nil, for: .default)
            shadowImage = transparent ? UIImage() : nil
            isTranslucent = transparent
        }
    }

    func makeBackgroundColor(_ color: UIColor?, for barMetrics: UIBarMetrics, animated: Bool = false) {
        animate(duration: animated ? 0.33 : 0) {
            setBackgroundImage(UIImage.image(from: color), for: barMetrics)
        }
    }
}

// MARK: - Private

private extension UIBarMetrics {
    static var allValues: [UIBarMetrics] {
        var allValues: [UIBarMetrics] = []
        switch UIBarMetrics.default {
        case .default: allValues.append(.default); fallthrough
        case .compact: allValues.append(.compact); fallthrough
        case .defaultPrompt: allValues.append(.defaultPrompt); fallthrough
        case .compactPrompt: allValues.append(.compactPrompt)
        @unknown default: break
        }
        return allValues
    }
}

private extension UINavigationBar {
    func applyState(_ state: NavigationBarState?, animated: Bool = false) {
        guard let state = state else { return }
        animate(duration: animated ? 0.33 : 0) {
            state.backgroundImages.forEach { image, metric in
                setBackgroundImage(image, for: metric)
            }
            shadowImage = state.shadowImage
            isTranslucent = state.isTranslucent
        }
    }

    func animate(duration: CFTimeInterval = 0.33, _ task: () -> Void) {
        if duration > 0 {
            let animation = CATransition()
            animation.duration = duration
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.type = .fade
            layer.add(animation, forKey: nil)
        }
        task()
    }
}

private struct NavigationBarState {
    let backgroundImages: [(UIImage?, UIBarMetrics)]
    let shadowImage: UIImage?
    let isTranslucent: Bool

    init(_ navigationBar: UINavigationBar) {
        var values: [(UIImage?, UIBarMetrics)] = []
        UIBarMetrics.allValues.forEach { metric in
            let image = navigationBar.backgroundImage(for: metric)
            values.append((image, metric))
        }
        backgroundImages = values
        shadowImage = navigationBar.shadowImage
        isTranslucent = navigationBar.isTranslucent
    }
}
