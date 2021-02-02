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
    mutating func union(_ element: Element, index: Self.Index) -> (unioned: Bool, memberAfterUnioned: Element) {
        if let index = firstIndex(of: element) {
            return (false, self[index])
        } else {
            insert(element, at: index)
            return (true, element)
        }
    }

    @discardableResult
    mutating func remove(_ element: Element) -> (removed: Bool, memberAfterRemoved: Element) {
        if let index = firstIndex(of: element) {
            remove(at: index)
            return (true, element)
        } else {
            return (false, element)
        }
    }
}

public extension Sequence {

    /// Return the sequence with all duplicates removed.
    ///
    /// Duplicate, in this case, is defined as returning `true` from `comparator`.
    ///
    /// - note: Taken from stackoverflow.com/a/46354989/3141234
    func uniqued(comparator: @escaping (Element, Element) throws -> Bool) rethrows -> [Element] {
        var buffer: [Element] = []

        for element in self {
            // If element is already in buffer, skip to the next element
            if try buffer.contains(where: { try comparator(element, $0) }) {
                continue
            }

            buffer.append(element)
        }

        return buffer
    }
}

public extension Sequence where Element: Hashable {

    /// Return the sequence with all duplicates removed.
    ///
    /// i.e. `[ 1, 2, 3, 1, 2 ].uniqued() == [ 1, 2, 3 ]`
    ///
    /// - note: Taken from stackoverflow.com/a/46354989/3141234, as
    ///         per @Alexander's comment.
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return self.filter { seen.insert($0).inserted }
    }
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
