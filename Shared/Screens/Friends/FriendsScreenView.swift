//
//  FriendsScreenView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/10/21.
//

import SwiftUI

struct FriendsScreenView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                NavigationBarView(title: "friends", leading: {}, trailing: {})
                VStack {
                    Spacer()
                    Text("Friends")
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FriendsScreenViewPreviews: PreviewProvider {
    static var previews: some View {
        FriendsScreenView()
    }
}
