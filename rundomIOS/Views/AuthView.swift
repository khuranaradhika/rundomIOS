//
//  AuthView.swift
//  rundomIOS
//
//  Created by Thomas Bird on 10/18/22.
//

import Foundation
import SwiftUI

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
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
                    //sign up
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
                    //login
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

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
