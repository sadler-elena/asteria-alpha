//
//  Line.swift
//  asteria alpha
//
//  Created by Jerry Turcios on 1/10/21.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct DashedLinePreviews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Text("login")
                .font(.custom(Fonts.quicksandBold, size: 50))
                .padding(.bottom, 6)
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(width: 116, height: 1)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
