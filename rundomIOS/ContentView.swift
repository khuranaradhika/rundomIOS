//
//  ContentView.swift
//  rundomIOS
//
//  Created by Rundom Development on 9/27/22.
//

import SwiftUI
import CoreData
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
        ScrollView{
            //Top Navigation Bar
            HStack {
                //Social Tab
                Button {
                    showingSocial.toggle()
                } label: {
                    Label("", systemImage: "person.2.circle")
                }
                Spacer()
                //Logo
                Text("Rundom")
                Spacer()
                //Profile
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("", systemImage: "person.crop.circle")
                }
                if(showingProfile){
                    ProfileView()
                }
            }
            Map(coordinateRegion: $viewmodel.region, showsUserLocation: true)
                .frame(height: 400)
                .accentColor(Color(.systemRed))
            
                .onAppear{
                    viewmodel.check_location_enabled()
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
