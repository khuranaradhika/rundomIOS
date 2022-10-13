//
//  ContentView.swift
//  rundomIOS
//
//  Created by Rundom Development on 9/27/22.
//

import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @StateObject private var viewmodel = MapViewModel()
    @State private var showingProfile = false
    @State private var showingSocial = false
    var body: some View {
        
        NavigationView{
            VStack{
                //Top Navigation Bar
                HStack {
                    NavigationLink(destination: SocialView(), label: {
                       Image(systemName: "person.line.dotted.person")})
                    .font(.system(size: 30))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x: 30)
                    
                    Spacer()
                    //Logo
                    Text("Rundom")
                        .offset(x: -125)
                        .font(.system(size: 25))
                    //Profile
                    
                    NavigationLink(destination: ProfileView(), label: {
                       Image(systemName: "person.crop.circle")})
                    .font(.system(size: 30))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x:-30)
                }
                 
                .offset(y:-290)
                Text("Weekly Stats")
                    .font(.system(size: 30))
                    .offset(y: -250)
                Text("You gave 34 ppl head this week")
                    .offset(y:-200)
                
                NavigationLink(destination: MapView(), label: {
                   Image(systemName: "map.circle")})
                .font(.system(size: 150))
                .shadow(color: .gray, radius: 3, x: 0, y: 3)
                .offset(y: 310)
                
                
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
