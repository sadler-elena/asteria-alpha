//
//  TransitsScreenView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/10/21.
//

import SwiftUI

struct TransitsScreenView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Navigation Bar
                VStack(spacing: 0) {
                    Text("transits")
                        .font(.custom(Fonts.quicksandBold, size: 30))
                        .padding(.bottom, 4)
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 1)
                }
                VStack {
                    Spacer()
                    Text("Transits")
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TransitsScreenViewPreviews: PreviewProvider {
    static var previews: some View {
        TransitsScreenView()
    }
}
