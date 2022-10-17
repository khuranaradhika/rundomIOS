//
//  ContentView.swift
//  rundomIOS
//
//  Created by Rundom Development on 9/27/22.
//

import SwiftUI
import CoreLocation
import MapKit
import FirebaseCore
import FirebaseDatabase

//==================================================================================

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
//==================================================================================
struct ContentView: View {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var firestoreManager: FirestoreManager
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @StateObject private var viewmodel = MapViewModel()
    @State private var stat_shit = "420"
    // Screen width.
    public var screenWidth: CGFloat {return UIScreen.main.bounds.width}
    // Screen height.
    public var screenHeight: CGFloat {return UIScreen.main.bounds.height}
    
    var body: some View {
        NavigationView{
            VStack{
                //Top Navigation Bar
                HStack {
                    //Feed Page
                    NavigationLink(destination: SocialView(), label: {
                       Image(systemName: "square.grid.3x3")})
                    .font(.system(size: screenWidth/12))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x: screenWidth/20)
                    Spacer()
                    //Friends Page
                    NavigationLink(destination: FriendsView(), label: {
                       Image(systemName: "person.line.dotted.person")})
                    .font(.system(size: screenWidth/12))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x: -screenWidth/3.33)
                    //Profile Page
                    NavigationLink(destination: ProfileView(), label: {
                       Image(systemName: "person.crop.circle")})
                    .font(.system(size: screenWidth/12))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x:-screenWidth/20 )
                }
                Spacer()
                Text("MOTD: \(firestoreManager.message)")
                    .offset(y: -screenHeight/200)
                //Weekly Stats
                NavigationView{
                    List{
                        HStack{Text("Total Miles Ran"); Spacer(); Text("420")}
                        HStack{Text("Total Running Time"); Spacer(); Text("420")}
                        HStack{Text("Total Goals Completed"); Spacer(); Text("420")}
                        HStack{Text("Total Number of Runs"); Spacer(); Text("420")}
                        HStack{Text("Miles Until Goal"); Spacer(); Text("420")}
                    }
                    .navigationTitle("This Week's Stats:")
                }
                //Map Page
                NavigationLink(destination: MapView(), label: {
                   Image(systemName: "map.circle")})
                .font(.system(size: screenWidth/3.5))
                .shadow(color: .gray, radius: 3, x: 0, y: 3)
                .offset(y: screenHeight/40)
            }
        }
    }
}
       
//==================================================================================

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//==================================================================================

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(FirestoreManager())
    }
}
