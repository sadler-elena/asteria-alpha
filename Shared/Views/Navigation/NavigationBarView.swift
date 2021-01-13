//
//  NavigationBarView.swift
//  asteria alpha (iOS)
//
//  Created by Geraldine Turcios on 1/13/21.
//

import SwiftUI

struct NavigationBarView<LeadingView: View, TrailingView: View>: View {
    var title: String
    var leading: LeadingView
    var trailing: TrailingView

    init(
        title: String,
        @ViewBuilder leading: @escaping () -> LeadingView,
        @ViewBuilder trailing: @escaping () -> TrailingView
    ) {
        self.title = title
        self.leading = leading()
        self.trailing = trailing()
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                leading
                Spacer()
                Text(title)
                    .font(.custom(Fonts.quicksandBold, fixedSize: 30))
                    .padding(.bottom, 4)
                Spacer()
                trailing
            }
            .padding(.horizontal, 8)
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 1)
        }
    }
}

struct NavigationBarViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack(spacing: 0) {
                NavigationBarView(title: "natal chart", leading: {}, trailing: {})
                VStack {
                    Spacer()
                    Text("Content goes here")
                    Spacer()
                }
            }
            VStack(spacing: 0) {
                NavigationBarView(title: "natal chart", leading: {}, trailing: {})
                VStack {
                    Spacer()
                    Text("Content goes here")
                    Spacer()
                }
            }
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .accessibilityLarge)
        }
    }
}
