//
//  LoginView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/9/21.
//

import SwiftUI

struct LoginView: View {
    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var isSignUpViewVisible = false

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 0) {
                Text("login")
                    .font(.custom(Fonts.quicksandBold, size: 50))
                    .padding(.bottom, 6)
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(width: 116, height: 1)
            }
            .padding(.bottom, 23)
            Group {
                TextField("Email", text: $emailText)
                    .font(.custom(Fonts.quicksandMedium, size: 18))
                SecureField("Password", text: $passwordText)
                    .font(.custom(Fonts.quicksandMedium, size: 18))
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom, 8)
            Button(action: {}) {
                Text("submit")
                    .modifier(PrimaryButtonStyle(textSize: 24, minHeight: 60))
                    .padding(.horizontal)
            }
            Spacer()
            VStack(spacing: 0) {
                Text("first time?")
                    .font(.custom(Fonts.quicksandMedium, size: 24))
                    .padding(.bottom, 16)
                Button(action: {}) {
                    Text("sign up")
                        .modifier(PrimaryButtonStyle(textSize: 24, minHeight: 60))
                        .padding(.horizontal)
                }
            }
            Spacer()
        }
    }
}

struct LoginViewPreviews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
