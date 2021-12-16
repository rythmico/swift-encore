public struct RuntimeError: Error {
    public var message: String

    public init(_ message: String) {
        self.message = message
    }

    public var localizedDescription: String {
        return message
    }
}

extension RuntimeError: Hashable {}

extension RuntimeError: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}
