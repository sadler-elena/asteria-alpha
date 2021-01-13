//
//  PrimaryButtonStyle.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/10/21.
//

import SwiftUI

struct PrimaryButtonStyle: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    var textSize: CGFloat
    var minHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.quicksandBold, size: textSize))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: minHeight)
            .background(colorScheme == .light ? Color.black : Color.white)
            .foregroundColor(colorScheme == .light ? .white : .black)
            .cornerRadius(10)
    }
}

struct PrimaryButtonStylePreviews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(action: {}) {
                Text("click me")
                    .modifier(PrimaryButtonStyle(textSize: 24, minHeight: 60))
            }
            .previewLayout(.sizeThatFits)
            .padding()
            Button(action: {}) {
                Text("click me")
                    .modifier(PrimaryButtonStyle(textSize: 24, minHeight: 60))
            }
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .accessibilityLarge)
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}
