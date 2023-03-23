import Foundation

public final class NNeomVecommerceSDK {
    internal var service: VecommerceService
    public static var isDebugEnabled: Bool = true
    public static var enviroment: Enviroment = .default
    public static var onUserNotFound: (() -> Void)?
    
    
    static var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        
        switch NNeomVecommerceSDK.enviroment {
        case .staging:
            components.host = "api.neomvcommerce.com"
        case .production:
            components.host = "api.neomvcommerce.com"
        }

        
        return components
    }
    
    
    public init(session: URLSession = .shared) {
        service = VecommerceService(session: session)
    }
    
//    public static func logout() {
//        VecommerceKit.token = nil
//        NeomUser.me = nil
//    }
    
}
