// https://api.neomvcommerce.com/swagger/#/User%20Points/getPoints

public protocol FetchPointsDataProvider {
    func fetchPoints(email model: String) async throws -> FetchPointsResult
}


struct FetchPointsEndpoint: EndpointProtocol {
    typealias Response = FetchPointsResult
    typealias InputType = FetchPointsInput
    var input: InputType
    var isAuthorized: Bool = false
    
    var path: String { "/user-points" }
    var httpmethod: HttpUrlMethod { .GET }
    var parameters: [String : String]? {
        [
            "email": input.email
        ]
    }
}

extension NNeomVecommerceSDK: FetchPointsDataProvider {
    public func fetchPoints(email model: String) async throws -> FetchPointsResult {
        let endpoint = FetchPointsEndpoint(input: FetchPointsInput(email: model))
        return try await service.fetch(endpoint)
    }
}
