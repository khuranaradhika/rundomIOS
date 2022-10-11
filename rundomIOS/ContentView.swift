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
<<<<<<< HEAD
    @StateObject private var viewmodel = MapViewModel()
    @State private var showingProfile = false
    var body: some View {
        ScrollView{
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("Profile", systemImage: "person.crop.circle")
=======
    
    var body: some View {
        Text("Rundom")
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
>>>>>>> b4fab32fefe306b9af1a91a633038bd0356ea817
                }
            if(showingProfile){
                ProfileView()
                
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
