//
//  Home.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-21.
//

import SwiftUI

struct Home: View {
    
    @State private var destinations = FileDecodingHelper<Destination>(file: "destinations").getData()
    
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
            ForEach(0..<destinations.count) { idx in
                GeometryReader { geo in
                    CardView(destination: $destinations[idx], expand: $expandView)
                        .padding(.horizontal, destinations[idx].expand ? 0 : 15)
                        .offset(y: destinations[idx].expand ? -geo.frame(in: .global).minY : 0)
                        .opacity(expandView ? (destinations[idx].expand ? 1 : 0) : 1)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                                if !destinations[idx].expand {
                                    expandView.toggle()
                                    destinations[idx].expand.toggle()
                                }
                            }
                        }
                    
                }
                .frame(height: destinations[idx].expand ? UIScreen.main.bounds.height : 250)
            }
        }
    }
}
