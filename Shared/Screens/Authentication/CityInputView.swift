//
//  CityInputView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/11/21.
//

import SwiftUI

struct CityInputView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.presentationMode) private var presentationMode

    @Binding var cityOfBirth: String

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "city of birth") {
                NavigationBackButton()
            } trailing: {
                NavigationBackButton()
                    .hidden()
            }
            VStack {
                Spacer()
                Text("City view")
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct CityInputViewPreviews: PreviewProvider {
    static var previews: some View {
        CityInputView(cityOfBirth: .mock(""))
    }
}
