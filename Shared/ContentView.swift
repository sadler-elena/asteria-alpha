//
//  ContentView.swift
//  Shared
//
//  Created by Elena Sadler on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("Token") private var token = ""

    var body: some View {
        if token.isEmpty {
            LoginView()
        } else {
            AppTabBarView()
        }
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
