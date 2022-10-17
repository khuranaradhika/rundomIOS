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
                    NavigationLink(destination: SocialView(), label: {
                        Image(systemName: "square.grid.3x3")})
                    .font(.system(size: screenWidth/12))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x: screenWidth/20)
                    
                    Spacer()
                    //Logo
                    NavigationLink(destination: FriendsView(), label: {
                        Image(systemName: "person.line.dotted.person")})
                    .font(.system(size: screenWidth/12))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x: -screenWidth/3.33)
                    
                    //Profile
                    
                    NavigationLink(destination: ProfileView(), label: {
                        Image(systemName: "person.crop.circle")})
                    .font(.system(size: screenWidth/12))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .offset(x:-screenWidth/20 )
                }
                .offset(y: -screenHeight/130)
            }
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
            .offset(y: -screenHeight/290)
            .frame(minHeight: screenHeight/1.19)
            
        
            
        }
        
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
