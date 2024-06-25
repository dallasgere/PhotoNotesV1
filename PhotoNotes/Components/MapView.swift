//
//  MapView.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/24/24.
//

import SwiftUI
import PhotosUI
import MapKit

// View only to be used in the destination View.
struct MapViewNew: View {
    // coordinates passed in from photo
    var coordinates: CLLocationCoordinate2D
    
    // the camera position we will show
    var cameraPosition: MapCameraPosition
    
    // title to pass in
    var title: String
    
    // sheet for annotations page
    @State private var isAnnotationTapped = false
    
    // initialize the struct
    init(coordinates: CLLocationCoordinate2D, title: String) {
        // setting coordinates
        self.coordinates = coordinates
        
        // setting the actual camera position now
        self.cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
            center: self.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        ))
        
        // setting the title
        self.title = title
    }
    
    var body: some View {
        Map(position: .constant(cameraPosition), bounds: nil, interactionModes: .all, scope: nil) {
            //            Marker(self.title, coordinate: self.coordinates)
            //                .tint(.red)
            Annotation(self.title, coordinate: self.coordinates) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.black)
                    Text("📸")
                        .padding(5)
                }
                .onTapGesture {
                    self.isAnnotationTapped = true
                }
            }
        }
        .sheet(isPresented: self.$isAnnotationTapped, content: {
            AnnotationDetailView(title: self.title, coordinate: self.coordinates)
        })
    }
}

private struct AnnotationDetailView: View {
    let title: String
    let coordinate: CLLocationCoordinate2D
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            
            Text("Latitude: \(coordinate.latitude)")
            Text("Longitude: \(coordinate.longitude)")
            
            Button("Get Directions") {
                openMapsWithDirections()
            }
            .padding()
        }
    }
    
    private func openMapsWithDirections() {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.name = title
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
}

//#Preview {
//    MapView()
//}
