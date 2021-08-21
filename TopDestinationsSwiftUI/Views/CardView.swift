//
//  CardView.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-21.
//

import SwiftUI

struct CardView: View {
  
  @Binding var destination: Destination
  @Binding var expand: Bool
  
  @State private var showMap = false
  
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Image(destination.image)
        .resizable()
        .frame(height: destination.expand ? 350 : 250)
        .cornerRadius(destination.expand ? 0 : 250)
      
      if destination.expand {
        ScrollView(.vertical, showsIndicators: false) {
          HStack {
            Text(destination.name)
              .font(.title)
              .bold()
            
            Spacer()
          }
          .padding()
          
          Text(destination.details)
            .padding(.horizontal)
          
          if destination.sevenWonder {
            HStack {
              Image("sevenWonder")
                .resizable()
                .frame(width: 100, height: 100)
              
              Text("This destination is one of the Seven Wonders of the world")
            }
          }
          
          Button(action: {
            showMap.toggle()
          }) {
            Text("Launch Map")
          }
          .sheet(isPresented: $showMap) {
            Text("Map is here")
          }
        }
      }
      Spacer(minLength: 0)
    }
    
    .padding(.horizontal, destination.expand ? 0 : 20)
    .contentShape(Rectangle())
    
    if destination.expand {
      Button(action: {
        
      }) {
        Image(systemName: "xmark")
          .foregroundColor(.white)
          .padding()
          .background(Color.black.opacity(0.8))
          .clipShape(Circle())
      }
      .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
      .padding(.trailing, 10)
    }
  }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
