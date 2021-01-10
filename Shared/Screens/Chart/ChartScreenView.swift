//
//  ChartScreenView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/10/21.
//

import SwiftUI

struct ChartScreenView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Navigation Bar
                VStack(spacing: 0) {
                    Text("natal chart")
                        .font(.custom(Fonts.quicksandBold, size: 30))
                        .padding(.bottom, 4)
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
            .navigationTitle("")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ChartScreenViewPreviews: PreviewProvider {
    static var previews: some View {
        ChartScreenView()
    }
}
