//
//  ProfileView.swift
//  rundomIOS
//
//  Created by Henry Webb on 10/10/22.
//

import Foundation
import SwiftUI
import Firebase

struct ProfileView: View {
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    @State private var finalProfile = Profile.default
    

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = Profile.default
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = finalProfile
                    }
                    .onDisappear {
                        finalProfile = draftProfile
                        
                    }
            
            Button{
                logout()
            } label: {
                Text("Log Out")
                    .bold()
                    .frame(width: 200, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.cyan, .blue], startPoint: .top, endPoint: .bottomTrailing))
                    )
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
    //logout function
    func logout() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
          return
        }
        //dismiss view **** NAV TO CONTENTVIEW ****
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
