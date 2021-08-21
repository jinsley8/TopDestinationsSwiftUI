//
//  City.swift
//  TopDestinationsSwiftUI
//
//  Created by Jonathon Insley on 2021-08-21.
//

import Foundation
import CoreLocation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coord: CLLocationCoordinate2D
}
