//
//  PrimaryButtonStyle.swift
//  asteria alpha
//
//  Created by Jerry Turcios on 1/10/21.
//

import SwiftUI

struct PrimaryButtonStyle: ViewModifier {
    var textSize: CGFloat
    var minHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.quicksandBold, size: textSize))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: minHeight)
            .background(Color.black)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct PrimaryButtonStylePreviews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("click me")
                .modifier(PrimaryButtonStyle(textSize: 24, minHeight: 60))
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
