//
//  RunView.swift
//  rundomIOS
//
//  Created by Henry Webb on 10/20/22.
//

import Foundation
import SwiftUI
import MapKit

//data for creating map easier
enum MapDetailsRun{
    static let startingLocation = CLLocationCoordinate2D(latitude: 42.727680, longitude: -73.691063)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
}
   
//==================================================================================

struct RunView: View{
    @StateObject private var RunModel = RunViewModel()
    // Screen width.
    public var screenWidth: CGFloat {return UIScreen.main.bounds.width}
    // Screen height.
    public var screenHeight: CGFloat {return UIScreen.main.bounds.height}
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View{
        NavigationView{
            VStack{
                Map(coordinateRegion: $RunModel.region, showsUserLocation: true)
                    .accentColor(Color(.systemRed))
                    .ignoresSafeArea()
                    .frame(height: screenHeight/2.4)
                Text("Current Run")
                    .font(.system(size: screenWidth/11))
                    .offset(x: -screenWidth/4)
                Spacer()
                HStack{
                    Text("Distance: ")
                        .font(.system(size: screenWidth/16))
                        .padding(.leading)
                    Spacer()
                    Text("4.20 Miles")
                        .font(.system(size: screenWidth/16))
                        .padding(.trailing)
                }
                Spacer()
                HStack{
                    Text("Time: ")
                        .font(.system(size: screenWidth/16))
                        .padding(.leading)
                    Spacer()
                    Text("42:69")
                        .font(.system(size: screenWidth/16))
                        .padding(.trailing)
                }
                Spacer()
                HStack{
                    Text("Pace: ")
                        .font(.system(size: screenWidth/16))
                        .padding(.leading)
                    Spacer()
                    Text("4:20/Mile")
                        .font(.system(size: screenWidth/16))
                        .padding(.trailing)
                }
                Spacer()
                
                NavigationLink(destination: Finished_View(), label: {Text("End Run")})
                    .font(.system(size: screenWidth/8))
                    .shadow(color: .gray, radius: 3, x: 0, y: 3)
                
                
            }
        }
    }
    
}
final class RunViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan)
    var locationManager: CLLocationManager?
    
}
struct RunView_Previews: PreviewProvider {
    static var previews: some View {RunView()}
}
