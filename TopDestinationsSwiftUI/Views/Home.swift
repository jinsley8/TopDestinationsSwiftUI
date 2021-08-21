//
//  Home.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-21.
//

import SwiftUI

struct Home: View {

  private var data = FileDecodingHelper<Destination>(file: "destinations").getData()
  
    var body: some View {
      VStack {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 16) {
            ForEach(data) { destination in
              Image(destination.image)
                .resizable()
                .frame(height: 250)
                .cornerRadius(25)
                .padding(.horizontal)
            }
          }
        }
      }
    }
  }
