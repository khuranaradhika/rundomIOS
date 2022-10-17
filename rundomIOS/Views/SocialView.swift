//
//  SocialView.swift
//  rundomIOS
//
//  Created by Henry Webb on 10/12/22.
//

import Foundation
import SwiftUI


struct SocialView: View {
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    var body: some View {
        VStack{
            
            NavigationView{
                HStack {
                    //This link is broken somehow
                    NavigationLink(destination: ContentView(), label: {
                        Image(systemName: "arrow.uturn.backward.circle")})
                    .font(.system(size: screenWidth/10))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x: -screenWidth/2.5)
                    
                }
                .offset(y: -screenHeight/40)
            }
            Text("Here You Will See Your Friends Activity")
                .offset(y: -screenHeight/30)
            List{
                ForEach(0..<20){ _ in
                    HStack{
                        ForEach(0..<3){ _ in
                            Image("BigBird")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            .offset(y: -screenHeight/60)
            .frame(minHeight: screenHeight/1.3)
        }
        
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
