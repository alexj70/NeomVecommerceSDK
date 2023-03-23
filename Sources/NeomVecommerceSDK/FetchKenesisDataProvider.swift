// https://api.neomvcommerce.com/swagger/#/Kinesis/getKinesisData

public protocol FetchKenesisDataProvider {
    func fetchKenesis(email model: String, fiat: String) async throws -> FetchKenesisResult
}


struct FetchKenesisEndpoint: EndpointProtocol {
    typealias Response = FetchKenesisResult
    typealias InputType = FetchKenesisInput
    var input: InputType
    var isAuthorized: Bool = false
    
    var path: String { "/kenesis" }
    var httpmethod: HttpUrlMethod { .GET }
    var parameters: [String : String]? {
        [
            "email": input.email,
            "fiat": input.fiat
        ]
    }
}
extension NNeomVecommerceSDK: FetchKenesisDataProvider {
    public func fetchKenesis(email model: String, fiat: String) async throws -> FetchKenesisResult {
        let input = FetchKenesisInput(email: model, fiat: fiat)
        let endpoint = FetchKenesisEndpoint(input: input)
        return try await service.fetch(endpoint)
    }
}
