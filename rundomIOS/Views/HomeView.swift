//
//  HomeView.swift
//  rundomIOS
//
//  Created by Thomas Bird on 11/4/22.
//

import SwiftUI
import CoreLocation
import MapKit
import Firebase


struct HomeView: View {
    //set app delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var firestoreManager: FirestoreManager
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @StateObject private var viewmodel = MapViewModel()
    
    //MAIN PAGE
    var body: some View {
        VStack{
                //"Rundom" Banner
                Text("Rundom")
                //Message of the Day
                Spacer(minLength: 1)
                Text("Today's Message: \(firestoreManager.message)")
                //View of current map
                Spacer(minLength: 2)
                Text("Map goes here")
                /*Start Run Button
                NavigationLink(destination: MapView().navigationBarBackButtonHidden(true), label: {
                   Image(systemName: "map.circle")})
                .shadow(color: .gray, radius: 3, x: 0, y: 3)*/
        }

    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FirestoreManager())
    }
}

