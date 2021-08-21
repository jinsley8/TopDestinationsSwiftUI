//
//  FileDecodingHelper.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-20.
//

import Foundation

struct FileDecodingHelper {
  let destinations: [Destination] = {
    guard let json = Bundle.main.url(forResource: "destinations", withExtension: "json") else {
      fatalError("JSON loading failed")
    }
    
    do {
      let jsonData = try Data(contentsOf: json)
      return try JSONDecoder().decode([Destination].self, from: jsonData)
    } catch let error {
      fatalError("JSON parsing failed with \(error)")
    }
  }()
}
