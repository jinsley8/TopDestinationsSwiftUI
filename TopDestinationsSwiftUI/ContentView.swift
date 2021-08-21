//
//  ContentView.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
          .padding()
          .onAppear {
            let destinations = FileDecodingHelper().destinations
            print(destinations[0].name)
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
