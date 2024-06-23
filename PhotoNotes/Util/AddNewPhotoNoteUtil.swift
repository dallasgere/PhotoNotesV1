//
//  AddNewPhotoNoteUtil.swift
//  PhotoNotes
//
//  Created by Dallas Gere on 6/23/24.
//

import Foundation
import PhotosUI

struct AddNewPhotoNoteUtil {
    // get the location data from an image
    static func getLocationData(from imageData: Data) -> CLLocationCoordinate2D? {
        guard let image = CIImage(data: imageData) else { return nil }
        
        var location: CLLocationCoordinate2D? = nil
        
        let properties = image.properties
        if let gps = properties[kCGImagePropertyGPSDictionary as String] as? [String: Any],
           let latitude = gps[kCGImagePropertyGPSLatitude as String] as? Double,
           let longitude = gps[kCGImagePropertyGPSLongitude as String] as? Double {
            location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
        return location
    }
}
