import Moya

public enum APITarget {

  case user
  case users(count: UInt)

}

extension APITarget: Moya.TargetType {

  public var baseURL: URL { return URL(string: "https://randomuser.me/")! }

  public var path: String { return "api/1.1/" }

  public var method: Moya.Method { return Moya.Method.get }

  public var task: Moya.Task {
    switch self {
    case .user:
      return Moya.Task.requestPlain
    case .users(count: let count):
      return Moya.Task.requestParameters(parameters: ["results": count], encoding: Moya.URLEncoding.queryString)
    }
  }

  public var headers: [String: String]? { return nil }

  public var sampleData: Data { return Data() }
}
