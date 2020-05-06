//
//  Array.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 02/10/20.
//  
//

public extension RangeReplaceableCollection where Element: Equatable {
    /// Append element to array if not exists
    @discardableResult
    mutating func union(_ element: Element) -> (appended: Bool, memberAfterAppend: Element) {
        if let index = firstIndex(of: element) {
            return (false, self[index])
        } else {
            append(element)
            return (true, element)
        }
    }
    
    @discardableResult
    mutating func union(_ element: Element, index: Self.Index) -> (appended: Bool, memberAfterAppend: Element) {
        if let index = firstIndex(of: element) {
            return (false, self[index])
        } else {
            insert(element, at: index)
            return (true, element)
        }
    }

    @discardableResult
    mutating func remove(_ element: Element) -> (appended: Bool, memberAfterAppend: Element) {
        if let index = firstIndex(of: element) {
            remove(at: index)
            return (true, element)
        } else {
            return (false, element)
        }
    }
}
