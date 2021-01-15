//
//  SettingsScreenView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/10/21.
//

import SwiftUI

struct SettingsScreenView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                NavigationBarView(title: "settings", leading: {}, trailing: {})
                VStack {
                    Spacer()
                    Text("Settings")
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsScreenViewPreviews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView()
    }
}
