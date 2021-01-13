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
            // Navigation Bar
            VStack(spacing: 0) {
                HStack {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                            .font(.title)
                            .foregroundColor(colorScheme == .light ? .black : .white)
                    }
                    Spacer()
                    Text("city of birth")
                        .font(.custom(Fonts.quicksandBold, size: 30))
                        .padding(.bottom, 4)
                    Spacer()
                    Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                        .font(.title)
                        .foregroundColor(.black)
                        .hidden()
                }
                .padding(.horizontal, 8)
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 1)
            }
            VStack {
                Spacer()
                Text("Chart")
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
