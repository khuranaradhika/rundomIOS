//
//  SocialView.swift
//  rundomIOS
//
//  Created by Henry Webb on 10/12/22.
//

import Foundation
import SwiftUI
struct SocialView: View {
    var body: some View {
            List{
                ForEach(0..<20){ _ in
                    HStack{
                        ForEach(0..<2){ _ in
                            Image("BigBird")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            
        
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
