//
//  PrimaryTextFieldStyle.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/11/21.
//

import SwiftUI

struct PrimaryTextFieldStyle: ViewModifier {
    var textSize: CGFloat

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .font(.custom(Fonts.quicksandMedium, size: textSize))
    }
}

struct PrimaryTextFieldStylePreviews: PreviewProvider {
    static var previews: some View {
        TextField("First name", text: .mock(""))
            .modifier(PrimaryTextFieldStyle(textSize: 18))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
