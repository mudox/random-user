import Foundation

public struct APIResponse: Codable {

  public let info: Info
  public let results: [User]

  public struct Info: Codable {
    let page: Int
    let results: Int
    let seed: String
    let version: String
  }
}

public struct User: Codable {
  public let cell: String
  public let dob: String
  public let email: String
  public let gender: String
  public let id: ID
  public let location: Location
  public let login: Credential
  public let name: Name
  public let nat: String
  public let phone: String
  public let picture: Avatar
  public let registered: String

  public struct ID: Codable {
    public let name: String?
    public let value: String?
  }

  public struct Location: Codable {
    public let city: String
    public let postcode: String
    public let state: String
    public let street: String

    public init(from decoder: Decoder) throws {
      let decoder = try decoder.container(keyedBy: CodingKeys.self)
      self.city = try decoder.decode(String.self, forKey: .city)
      self.state = try decoder.decode(String.self, forKey: .state)
      self.street = try decoder.decode(String.self, forKey: .street)
      self.postcode = (try? decoder.decode(String.self, forKey: .postcode))
        ?? String(try! decoder.decode(Int.self, forKey: .postcode))
    }
  }

  public struct Credential: Codable {
    public let username: String
    public let password: String

    public let md5: String
    public let salt: String
    public let sha1: String
    public let sha256: String
  }

  public struct Name: Codable {
    public let first: String
    public let last: String
    public let title: String
  }

  public struct Avatar: Codable {
    public let large: URL
    public let medium: URL
    public let thumbnail: URL
  }
}
