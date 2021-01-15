//
//  NavigationBackButton.swift
//  asteria alpha (iOS)
//
//  Created by Geraldine Turcios on 1/13/21.
//

import SwiftUI

struct NavigationBackButton: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        Button(action: { presentationMode.wrappedValue.dismiss() }) {
            Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                .font(.title)
                .foregroundColor(colorScheme == .light ? .black : .white)
        }
    }
}

struct NavigationBackButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationBackButton()
                .previewLayout(.sizeThatFits)
                .padding()
            NavigationBackButton()
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
