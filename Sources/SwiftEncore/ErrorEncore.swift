#if DEBUG
extension String: Error {
    public var localizedDescription: String { self }
}
#endif
