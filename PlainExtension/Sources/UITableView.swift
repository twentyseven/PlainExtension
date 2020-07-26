//
//  UITableView.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 2/24/20.
//
//

import Foundation

public protocol ReusableView {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - Table View

extension UITableViewCell: ReusableView {}

extension UITableViewHeaderFooterView: ReusableView {}

public extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
        return cell
    }

    func register<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        let view = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as! T
        return view
    }
}

// MARK: - Collection View

extension UICollectionViewCell: ReusableView {}
extension UICollectionReusableView: ReusableView {}

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UICollectionReusableView>(_: T.Type, viewKind: String) {
        register(T.self, forSupplementaryViewOfKind: viewKind, withReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
        return cell
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(for indexPath: IndexPath, ofKind kind: String) -> T {
        let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
        return view
    }
}
