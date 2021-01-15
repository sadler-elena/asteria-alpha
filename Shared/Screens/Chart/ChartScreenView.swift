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
                NavigationBarView(title: "natal chart", leading: {}, trailing: {})
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
