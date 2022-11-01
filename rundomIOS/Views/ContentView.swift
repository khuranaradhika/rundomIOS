//
//  ContentView.swift
//  rundomIOS
//
//  Created by Rundom Development on 9/27/22.
//

import SwiftUI
import CoreLocation
import MapKit
import Firebase

//APP DELEGATE=========================================================================

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


//CONTENT VIEW ===================================================================
struct ContentView: View {
    //user variables
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    //set app delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var firestoreManager: FirestoreManager
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @StateObject private var viewmodel = MapViewModel()
    @State private var stat_shit = "420"
    // extension View{
    //     func getScreenBounds() -> CGRect{
    //         return UIScreen.main.bounds
    //     }
    // }
    // Screen width.
    public var screenWidth: CGFloat {return UIScreen.main.bounds.width}
    // Screen height.
    public var screenHeight: CGFloat {return UIScreen.main.bounds.height}
    
    var body: some View {
        //USER LOGGED IN:
        if userIsLoggedIn{
            NavigationView{
                VStack{
                    //Top Navigation Bar
                    HStack {
                        //Feed Page
                        NavigationLink(destination: SocialView(), label: {
                           Image(systemName: "square.grid.3x3")})
                        .font(.system(size: screenWidth/12))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .padding(.leading)
                        Spacer()
                        //Friends Page
                        NavigationLink(destination: FriendsView(), label: {
                           Image(systemName: "person.line.dotted.person")})
                        .font(.system(size: screenWidth/12))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        Spacer()
                        //Profile Page
                        NavigationLink(destination: ProfileView(), label: {
                           Image(systemName: "person.crop.circle")})
                        .font(.system(size: screenWidth/12))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .padding(.trailing)
                    }
                    Spacer()
                    Text("MOTD: \(firestoreManager.message)")
                    //Weekly Stats
                    NavigationView{
                        List{
                            HStack{
                                Text("Total Miles Ran")
                                Spacer()
                                Text("420")}
                            HStack{
                                Text("Total Running Time")
                                Spacer()
                                Text("420")
                            }
                            HStack{
                                Text("Total Number of Runs")
                                Spacer()
                                Text("420")}
                            HStack{
                                Text("Miles Until Goal")
                                Spacer()
                                Text("420")
                            }
                            HStack{
                                Text("Total Miles Ran")
                                Spacer()
                                Text("420")}
                            HStack{
                                Text("Total Running Time")
                                Spacer()
                                Text("420")
                            }
                        }
                        .navigationTitle("Your Week's Stats:")
                    }
                    Spacer()
                    //Map Page
                    NavigationLink(destination: MapView(), label: {
                       Image(systemName: "map.circle")})
                    .font(.system(size: screenWidth/3))
                    .shadow(color: .gray, radius: 3, x: 0, y: 3)
                }
            }
        //USER NOT LOGGED IN
        }else{
            content
        }
    }
    
//AUTHENTICATION VIEW ================================================================================================
    var content: some View {
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint:
                        .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1200, height: 500)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                HStack{
                    Text("Rundom")
                    Image(systemName: "figure.run")
                }
                .foregroundColor(.white)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .offset(x: -50, y:-100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button{
                    register()
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.cyan, .blue], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil{
                        userIsLoggedIn.toggle()
                        body
                    }
                }
            }
        }
        .frame(height: screenHeight)
    }
//FUNCTIONS ==========
    //login func
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    //register func
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
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


//CONTENTVIEW PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(FirestoreManager())
    }
}

// EXTENSION VIEW
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
