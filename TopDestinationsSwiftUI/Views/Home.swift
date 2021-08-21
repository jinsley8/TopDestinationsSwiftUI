//
//  Home.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-21.
//

import SwiftUI

struct Home: View {

  private var data = FileDecodingHelper<Destination>(file: "destinations").getData()
  
  @State private var expandView = false
  
  var body: some View {
    VStack {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          headerView
          
          destinationView
        }
      }
    }
  }
  
  private var headerView: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("Top Destinations")
          .font(.largeTitle)
          .bold()
      }
      
      Spacer()
    }.padding()
  }
  
  private var destinationView: some View {
    VStack(spacing: 15) {
      ForEach(data) { destination in
        GeometryReader { geo in
          Image(destination.image)
            .resizable()
            .cornerRadius(destination.expand ? 0 : 25)
            .padding(.horizontal, destination.expand ? 0 : 15)
            .offset(y: destination.expand ? -geo.frame(in: .global).minY : 0)
            .opacity(expandView ? (destination.expand ? 1 : 0) : 1)
            .onTapGesture {
              expandView.toggle()
              destination.expand.toggle()
            }
        }
        .frame(height: destination.expand ? UIScreen.main.bounds.height : 250)
        .gesture(DragGesture(minimumDistance: destination.expand ? 0 : 500))
      }
    }
  }
}
