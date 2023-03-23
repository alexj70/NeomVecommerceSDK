import Foundation

extension NSError {
    static var failedResult: NSError {
        let userInfo: [String: Any] = [
            NSLocalizedDescriptionKey : NSLocalizedString("Something went wrong. Please try again later!", comment: "")]
        return NSError(domain: "VecommerceKit", code: 100008, userInfo: userInfo)
    }
}
