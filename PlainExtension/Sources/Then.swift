//
//  Then.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/28/19.
//
//

protocol Then {}

extension Then where Self: AnyObject {
    
    /// Allow customize object after init.
    ///
    ///     let view = UIButton(type: .custom).then {
    ///       $0.setTitle("Hi", for: .normal) = .center
    ///     }
    /// - Parameter then: A customization block of code
    func then(_ then: ((Self) -> ())) -> Self {
        then(self)
        return self
    }
}

extension NSObject: Then {}
