//
//  String.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//
//

// MARK: - String & Substring subscript
// https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language/38215613#38215613

public extension StringProtocol {
    subscript(_ offset: Int) -> Element { self[index(startIndex, offsetBy: offset)] }
    subscript(_ range: Range<Int>) -> SubSequence { prefix(range.lowerBound + range.count).suffix(range.count) }
    subscript(_ range: ClosedRange<Int>) -> SubSequence { prefix(range.lowerBound + range.count).suffix(range.count) }
    subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
    subscript(_ range: PartialRangeUpTo<Int>) -> SubSequence { prefix(range.upperBound) }
    subscript(_ range: PartialRangeFrom<Int>) -> SubSequence { suffix(Swift.max(0, count - range.lowerBound)) }
}

public extension LosslessStringConvertible {
    var string: String { .init(self) }
}

public extension BidirectionalCollection {
    subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}

// MARK: - String size calculation

public extension String {
    func sizeThatFit(width: CGFloat, font: UIFont) -> CGSize {
        let maxSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        return actualSize.size
    }

    func sizeThatFit(height: CGFloat, font: UIFont) -> CGSize {
        let maxSize = CGSize(width: .greatestFiniteMagnitude, height: height)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        return actualSize.size
    }
}

public extension NSAttributedString {
    func sizeThatFit(width: CGFloat) -> CGSize {
        let maxSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let actualSize = boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], context: nil)
        return actualSize.size
    }

    func sizeThatFit(height: CGFloat) -> CGSize {
        let maxSize = CGSize(width: .greatestFiniteMagnitude, height: height)
        let actualSize = boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], context: nil)
        return actualSize.size
    }
}
