public struct FetchKenesisResult: Decodable {
    public struct Metal: Decodable {
        public let available: Double
        public let allocatedOnExchange: Int
    }
    public let kauAskPrice: Double
    public let kagAskPrice: Double
    public let kau: Metal
    public let kag: Metal
}

/**
{
  "kauAskPrice": 59.89,
  "kagAskPrice": 22.09,
  "kau": {
    "available": 0.01653,
    "allocatedOnExchange": 0
  },
  "kag": {
    "available": 0,
    "allocatedOnExchange": 0
  }
}
*/
