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

    var isInformationValid: Bool {
        return !emailText.isEmpty && !passwordText.isEmpty
    }

    var body: some View {
        NavigationView {
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
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $passwordText)
                }
                .modifier(PrimaryTextFieldStyle(textSize: 18))
                .padding(.horizontal)
                .padding(.bottom, 8)
                Button(action: {}) {
                    Text("submit")
                        .modifier(PrimaryButtonStyle(textSize: 24, minHeight: 60))
                        .padding(.horizontal)
                }
                .disabled(isInformationValid ? false : true)
                .opacity(isInformationValid ? 1 : 0.5)
                Spacer()
                VStack(spacing: 0) {
                    Text("first time?")
                        .font(.custom(Fonts.quicksandMedium, size: 24))
                        .padding(.bottom, 16)
                    NavigationLink(destination: SignUpView()) {
                        Text("sign up")
                            .modifier(PrimaryButtonStyle(textSize: 24, minHeight: 60))
                            .padding(.horizontal)
                    }
                }
                Spacer()
            }
            .transition(.move(edge: .bottom))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginViewPreviews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
