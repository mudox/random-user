import Foundation

public class RandomUserGenerator {
  
  public init() {}
  
  let maxUsers = 5000

  lazy var assetsBundle: Bundle = {
    let frameworkBundle = Bundle(for: RandomUserGenerator.self)
    let assetsBundleURL = frameworkBundle.url(forResource: "Assets", withExtension: "bundle")!
    return Bundle(url: assetsBundleURL)!
  }()

  lazy var allUsers: [User] = {
    let url = assetsBundle.url(forResource: "users", withExtension: "json")!
    let data = try! Data(contentsOf: url)

    do {
      return try JSONDecoder().decode([User].self, from: data)
    } catch {
      print("Decoding error: \(error)")
      return []
    }
  }()

  lazy var allMales: [User] = {
    let url = assetsBundle.url(forResource: "males", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    
    do {
      return try JSONDecoder().decode([User].self, from: data)
    } catch {
      print("Decoding error: \(error)")
      return []
    }
  }()
  
  lazy var allFemales: [User] = {
    let url = assetsBundle.url(forResource: "females", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    
    do {
      return try JSONDecoder().decode([User].self, from: data)
    } catch {
      print("Decoding error: \(error)")
      return []
    }
  }()
  
  // MARK: - Public Interface

  public func users(count: UInt) -> [User] {
    var users = [User]()
    for _ in 0..<min(maxUsers, Int(count)) {
      let aUser = allUsers[Int(arc4random() % UInt32(maxUsers))]
      users.append(aUser)
    }
    return users
  }
  
  public func males(count: UInt) -> [User] {
    var users = [User]()
    for _ in 0..<min(maxUsers, Int(count)) {
      let aUser = allMales[Int(arc4random() % UInt32(maxUsers))]
      users.append(aUser)
    }
    return users
  }
 
  public func females(count: UInt) -> [User] {
    var users = [User]()
    for _ in 0..<min(maxUsers, Int(count)) {
      let aUser = allFemales[Int(arc4random() % UInt32(maxUsers))]
      users.append(aUser)
    }
    return users
  }
  
}

