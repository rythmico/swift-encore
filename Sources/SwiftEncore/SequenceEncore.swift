extension Sequence {
    public var array: [Element] {
        Array(self)
    }
}

extension Sequence {
    @inlinable
    public func count(
        where predicate: (Element) throws -> Bool
    ) rethrows -> Int {
        var count = 0
        for e in self {
            if try predicate(e) {
                count += 1
            }
        }
        return count
    }
}

extension Sequence where Element: Sequence {
    public func flattened() -> [Element.Element] {
        flatMap { $0 }
    }
}

extension Sequence {
    public func sorted<T>(
        by value: KeyPath<Element, T>,
        _ areInIncreasingOrder: (T, T) throws -> Bool
    ) rethrows -> [Element] {
        try sorted(by: { try areInIncreasingOrder($0[keyPath: value], $1[keyPath: value]) })
    }

    public func sorted<T>(by value: KeyPath<Element, T>) -> [Element] where T: Comparable {
        sorted(by: value, <)
    }
}

extension Sequence {
    public func min<T>(
        by value: KeyPath<Element, T>,
        _ areInIncreasingOrder: (T, T) throws -> Bool
    ) rethrows -> Element? {
        try self.min(by: { try areInIncreasingOrder($0[keyPath: value], $1[keyPath: value]) })
    }

    public func min<T>(by value: KeyPath<Element, T>) -> Element? where T: Comparable {
        min(by: value, <)
    }
}

extension Sequence {
    public func max<T>(
        by value: KeyPath<Element, T>,
        _ areInIncreasingOrder: (T, T) throws -> Bool
    ) rethrows -> Element? {
        try self.max(by: { try areInIncreasingOrder($0[keyPath: value], $1[keyPath: value]) })
    }

    public func max<T>(by value: KeyPath<Element, T>) -> Element? where T: Comparable {
        max(by: value, <)
    }
}

extension Sequence {
    public func minAndMax<T>(
        by value: KeyPath<Element, T>,
        _ areInIncreasingOrder: (T, T) throws -> Bool
    ) rethrows -> (min: Element, max: Element)? {
        try self.minAndMax(by: { try areInIncreasingOrder($0[keyPath: value], $1[keyPath: value]) })
    }

    public func minAndMax<T>(by value: KeyPath<Element, T>) -> (Element, Element)? where T: Comparable {
        minAndMax(by: value, <)
    }
}

public func * <Base1: Sequence, Base2: Collection>(
    lhs: Base1,
    rhs: Base2
) -> Product2Sequence<Base1, Base2> {
    product(lhs, rhs)
}
