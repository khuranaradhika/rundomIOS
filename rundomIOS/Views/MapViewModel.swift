/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that presents a map.
*/

import SwiftUI
import MapKit

//data for creating map easier
enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 42.727680, longitude: -73.691063)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
}
   
//==================================================================================

struct MapView: View{
    @StateObject private var MapModel = MapViewModel()
    var body: some View{
        Map(coordinateRegion: $MapModel.region, showsUserLocation: true)
            .accentColor(Color(.systemRed))
            .ignoresSafeArea()
            .onAppear{
                MapModel.check_location_enabled()
            }
    }
    
}
final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan)
    var locationManager: CLLocationManager?
    func check_location_enabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }
        else{print("locations off")}
    }
    
    //Checking if we have permission to use location
    private func check_authorization() {
        guard let locationManager = locationManager else{return}
        switch locationManager.authorizationStatus{
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("location is restricted")
        case .denied:
            print("location was denied")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span:  MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        check_authorization()
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {MapView()}
}

