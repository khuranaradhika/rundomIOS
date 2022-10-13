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
                    .font(.system(size: 30))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x: screenWidth/20)
                    
                    Spacer()
                    //Logo
                    Image(systemName: "figure.run")
                        .offset(x: -screenWidth/2.85)
                        .font(.system(size: 35))
                        .foregroundColor(.blue)
                    //Profile
                    
                    NavigationLink(destination: ProfileView(), label: {
                       Image(systemName: "person.crop.circle")})
                    .font(.system(size: 30))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x:-screenWidth/20 )
                }
                 
                .offset(y:-screenHeight/3.2)
                Text("Weekly Stats")
                    .font(.system(size: 30))
                    .offset(y: -screenHeight/3.5)
                Text("You gave 34 ppl head this week")
                    .offset(y:-screenHeight/4)
                
                NavigationLink(destination: MapView(), label: {
                   Image(systemName: "map.circle")})
                .font(.system(size: 150))
                .shadow(color: .gray, radius: 3, x: 0, y: 3)
                .offset(y: screenHeight/3.2)
                
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
