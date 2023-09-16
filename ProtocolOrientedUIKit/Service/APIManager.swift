//
//  APIManager.swift
//  ProtocolOrientedUIKit
//
//  Created by Atil Samancioglu on 15.09.2022.
//

import Foundation
// singleton değil protokol yapısını kullanmak istiyoruz
class APIManager {
  
  static let shared = APIManager()
  
  private init() {}
  
  func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    URLSession.shared.dataTask(with: url) { data, res, error in
      guard let data = data else { return }
      DispatchQueue.main.async {
          if let user = try? JSONDecoder().decode([User].self, from: data).first { // bu uygulamada bi kullanıcı olucak o yüzden first diyoruz
          completion(.success(user))
        } else {
          completion(.failure(NSError()))
        }
      }
    }.resume()
  }
  
}
