//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

protocol Mockable: AnyObject {

  var bundle: Bundle { get }
  func loadJSON<T: Decodable>(
    filename: String,
    type: T.Type
  ) -> T
}

/// Here can force unwrap and have fatal errors for development and testing
extension Mockable {

  var bundle: Bundle {
    Bundle(
      for: type(
        of: self
      ))
  }

  func loadJSON<T: Decodable>(
    filename: String,
    type: T.Type
  ) -> T {

    guard let path = bundle.url(
      forResource: filename,
      withExtension: "json"
    ) else {
      fatalError("Failed to load JSON")
    }

    do {
      let data = try Data(contentsOf: path)
      let decodedObject = try JSONDecoder().decode(type, from: data)

      return decodedObject
    } catch {
      fatalError("Failed to decode loaded JSON")
    }
  }
}

