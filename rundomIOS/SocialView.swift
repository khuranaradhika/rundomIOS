//
//  SocialView.swift
//  rundomIOS
//
//  Created by Henry Webb on 10/12/22.
//

import Foundation
import SwiftUI
struct SocialView: View {
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    @State private var finalProfile = Profile.default
    

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
           Text("Nuts, Balls, Cock")
            
        }
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
