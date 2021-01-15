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
                NavigationBarView(title: "transits", leading: {}, trailing: {})
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
