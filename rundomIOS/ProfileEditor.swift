//
//  ProfileView.swift
//  rundomIOS
//
//  Created by Henry Webb on 10/10/22.
//

import Foundation
import SwiftUI

struct ProfileEditor: View{
    @Binding var profile: Profile
   

    var body: some View{
        NavigationView{
            Form{
                Section(header: Text("Personal Information")){
                    TextField("First Name", text: $profile.firstname)
                    TextField("Last Name", text: $profile.lastname)
                    DatePicker("Birthdate", selection: $profile.birthdate, displayedComponents: .date)
                }
                
                Section(header: Text("Personal Goals")){
                    TextField("Goal num of Runs Per Week", text: $profile.goal_runs)
                }
            }
            .navigationTitle("My Profile")
            
        }
    }
}
struct ProfileEditor_Previews: PreviewProvider{
    static var previews: some View{
        ProfileEditor(profile: .constant(.default))
    }
}
