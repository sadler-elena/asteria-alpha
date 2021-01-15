//
//  SignUpView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/10/21.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.presentationMode) private var presentationMode

    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var confirmPasswordText = ""
    @State private var firstNameText = ""
    @State private var lastNameText = ""
    @State private var usernameText = ""
    @State private var dateOfBirth = Date()
    @State private var cityOfBirth = ""

    var isPasswordConfirmed: Bool {
        if !emailText.isEmpty && passwordText == confirmPasswordText && !passwordText.isEmpty {
            return true
        }
        return false
    }

    func createButtonTapped() {
        // Sends request to API; If successful, pop screen and have user login
    }

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "sign up") {
                NavigationBackButton()
            } trailing: {
                NavigationBackButton()
                    .hidden()
            }
            ScrollView {
                TextField("First name", text: $firstNameText)
                    .disableAutocorrection(true)
                    .modifier(PrimaryTextFieldStyle(textSize: 18))
                    .padding([.horizontal, .top])
                    .padding(.bottom, 8)
                Group {
                    TextField("Last name", text: $lastNameText)
                        .disableAutocorrection(true)
                    TextField("@username", text: $usernameText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    TextField("Email", text: $emailText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $passwordText)
                    SecureField("Confirm password", text: $confirmPasswordText)
                }
                .modifier(PrimaryTextFieldStyle(textSize: 18))
                .padding(.horizontal)
                .padding(.bottom, 8)
                VStack(spacing: 20) {
                    DatePicker("Date of birth", selection: $dateOfBirth)
                    NavigationLink(destination: CityInputView(cityOfBirth: $cityOfBirth)) {
                        HStack {
                            Text("City of birth")
                                .foregroundColor(Color(.label))
                            Spacer()
                            Text(cityOfBirth.isEmpty ? "Select a city" : cityOfBirth)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .font(.custom(Fonts.quicksandRegular, size: 20))
                .padding()
                Button(action: createButtonTapped) {
                    Text("create")
                        .modifier(PrimaryButtonStyle(textSize: 24, minHeight: 60))
                        .padding(.horizontal)
                }
                .disabled(isPasswordConfirmed ? false : true)
                .opacity(isPasswordConfirmed ? 1 : 0.5)
                .padding(.bottom)
            }
        }
        .navigationBarHidden(true)
    }
}

struct SignUpViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
                .previewDevice("iPhone 12 Pro Max")
            SignUpView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
