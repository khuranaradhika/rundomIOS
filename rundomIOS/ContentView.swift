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

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

struct ContentView: View {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @StateObject private var viewmodel = MapViewModel()
    @State private var showingProfile = false
    @State private var showingSocial = false
    @State private var stat_shit = "420"
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    
    var body: some View {
        NavigationView{
            VStack{
                

                //Top Navigation Bar
                HStack {
                    NavigationLink(destination: SocialView(), label: {
                       Image(systemName: "person.line.dotted.person")})
                    .font(.system(size: 40))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x: screenWidth/20)
                    
                    Spacer()
                    //Logo
                    Image(systemName: "figure.run")
                        .offset(x: -screenWidth/3.2)
                        .font(.system(size: 40))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .foregroundColor(.blue)
                    //Profile
                    
                    NavigationLink(destination: ProfileView(), label: {
                       Image(systemName: "person.crop.circle")})
                    .font(.system(size: 40))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x:-screenWidth/20 )
                }
                .offset(y: -screenHeight/200)
                NavigationView{
                    List{
                        
                        HStack{
                            Text("Total Miles Ran")
                                Spacer()
                            Text("420")
                        }
                        HStack{
                            Text("Total Running Time")
                                Spacer()
                            Text("420")
                        }
                        HStack{
                            Text("Total Goals Completed")
                                Spacer()
                            Text("420")
                        }
                        HStack{
                            Text("Total Number of Runs")
                                Spacer()
                            Text("420")
                        }
                        HStack{
                            Text("Miles Until Goal")
                                Spacer()
                            Text("420")
                        }

                        

                    }
                    .navigationTitle("This Week's Stats:")
                    .onAppear{
                        UITableView.appearance().backgroundColor = .clear

                    }
                    
                }
                
                NavigationLink(destination: MapView(), label: {
                   Image(systemName: "map.circle")})
                .font(.system(size: 150))
                .shadow(color: .gray, radius: 3, x: 0, y: 3)
                .offset(y: screenHeight/40)
                
            }
        }
        
    }
        
    
}
       

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
