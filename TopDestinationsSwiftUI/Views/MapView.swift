//
//  MapView.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var destination: Destination
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(destination.latitude)!, longitude: Double(destination.longitude)!), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))), interactionModes: [.all], showsUserLocation: false, userTrackingMode: .constant(.none), annotationItems: [destination.city], annotationContent: {
                MapAnnotation(coordinate: $0.coord) {
                    LottieView()
                        .frame(width: 100, height: 100)
                }
            })
            
            Button(action: {
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .clipShape(Circle())
            }
            .padding(.top, 10)
            .padding(.trailing, 10)
        }
    }
}

