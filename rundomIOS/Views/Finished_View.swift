//
//  Finished_View.swift
//  rundomIOS
//
//  Created by Henry Webb on 11/1/22.
//
import Foundation
import SwiftUI


struct Finished_View: View {
    // Screen width.
    public var screenWidth: CGFloat {return UIScreen.main.bounds.width}
    // Screen height.
    public var screenHeight: CGFloat {return UIScreen.main.bounds.height}
    var body: some View {
        NavigationView{
            VStack{
                Text("Congrats You Survived")
                    .font(.system(size: screenWidth/11))
                Spacer()
                NavigationLink(destination: ContentView().body.navigationBarBackButtonHidden(true), label: {
                        Image(systemName: "house")})
                    .font(.system(size: screenWidth/3))
                    .shadow(color: .gray, radius: 3, x: 0, y: 3)
                    
                
                
                
                HStack{
                    Text("Distance: ")
                        .font(.system(size: screenWidth/16))
                        .padding(.leading)
                    Spacer()
                    Text("4.20 Miles")
                        .font(.system(size: screenWidth/16))
                        .padding(.trailing)
                }
                HStack{
                    Text("Time: ")
                        .font(.system(size: screenWidth/16))
                        .padding(.leading)
                    Spacer()
                    Text("42:69")
                        .font(.system(size: screenWidth/16))
                        .padding(.trailing)
                }
                HStack{
                    Text("Pace: ")
                        .font(.system(size: screenWidth/16))
                        .padding(.leading)
                    Spacer()
                    Text("4:20/Mile")
                        .font(.system(size: screenWidth/16))
                        .padding(.trailing)
                }
            }
        }
    }
}

struct Finished_View_Previews: PreviewProvider {
    static var previews: some View {
        Finished_View()
    }
}
