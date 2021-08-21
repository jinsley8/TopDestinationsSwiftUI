//
//  Destination.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-20.
//

import Foundation

final class Destination: Decodable, Identifiable {
  let id = UUID()
  let name: String
  let latitude: String
  let longitude: String
  let image: String
  let sevenWonder: Bool
  let overlay: Bool
  let details: String
  var expand: Bool
  
  init(from decoder: Decoder) throws {
    
    enum CodingKey: Swift.CodingKey {
      case name
      case latitude
      case longitude
      case image
      case sevenWonder
      case overlay
      case details
      case expand
    }
    
    let values = try decoder.container(keyedBy: CodingKey.self)
    name = try values.decode(String.self, forKey: .name)
    latitude = try values.decode(String.self, forKey: .latitude)
    longitude = try values.decode(String.self, forKey: .longitude)
    image = try values.decode(String.self, forKey: .image)
    sevenWonder = try values.decode(Bool.self, forKey: .sevenWonder)
    overlay = try values.decode(Bool.self, forKey: .overlay)
    details = try values.decode(String.self, forKey: .details)
    expand = try values.decode(Bool.self, forKey: .expand)
  }
}
