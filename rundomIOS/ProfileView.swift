//
//  ProfileView.swift
//  rundomIOS
//
//  Created by Henry Webb on 10/10/22.
//

import Foundation
import SwiftUI
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
            
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
