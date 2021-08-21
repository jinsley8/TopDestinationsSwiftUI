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
            VStack {
                Image(destination.image)
                    .resizable()
                    .frame(height: destination.expand ? 350 : 250)
                    .cornerRadius(destination.expand ? 0 : 25)
                
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
                                
                                Text("This destination is one of the Seven Wonders of the World!")
                            }
                        }
                        
                        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(destination.latitude)!, longitude: Double(destination.longitude)!), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))), interactionModes: [.zoom])
                            .frame(height: 200)
                            .cornerRadius(25)
                            .padding(.horizontal)
                        
                        Button(action: {
                            showMap.toggle()
                        }) {
                            Text("Launch Map")
                        }
                        .sheet(isPresented: $showMap) {

                        }
                    }
                }
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, destination.expand ? 0 : 20)
            .contentShape(Rectangle())
            
            if destination.expand {
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                        destination.expand.toggle()
                        expand.toggle()
                        
                    }
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
}
