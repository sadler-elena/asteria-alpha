//
//  AppTabBarView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/10/21.
//

import SwiftUI

fileprivate struct AppTabBarItemView: View {
    @Binding var selectedTab: AppTabBarView.Tab
    var tab: AppTabBarView.Tab
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.largeTitle)
            .foregroundColor(selectedTab == tab ? .white : .gray)
            .onTapGesture { selectedTab = tab }
    }
}

struct AppTabBarView: View {
    @State private var selectedTab = Tab.chart

    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case .chart: ChartScreenView()
            case .transits: TransitsScreenView()
            case .friends: FriendsScreenView()
            case .settings: SettingsScreenView()
            }
            ZStack {
                // Used to fill the bottom notch on some devices
                Rectangle()
                    .fill(Color.black)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 70)
                    .offset(y: 60)
                HStack {
                    AppTabBarItemView(
                        selectedTab: $selectedTab,
                        tab: .chart,
                        systemName: "person.fill"
                    )
                    Spacer()
                    AppTabBarItemView(
                        selectedTab: $selectedTab,
                        tab: .transits,
                        systemName: "calendar"
                    )
                    Spacer()
                    AppTabBarItemView(
                        selectedTab: $selectedTab,
                        tab: .friends,
                        systemName: "person.fill.badge.plus"
                    )
                    Spacer()
                    AppTabBarItemView(
                        selectedTab: $selectedTab,
                        tab: .settings,
                        systemName: "gearshape.fill"
                    )
                }
                .padding()
                .padding(.horizontal)
                .background(Color.black)
            }
        }
    }
}

extension AppTabBarView {
    enum Tab {
        case chart
        case transits
        case friends
        case settings
    }
}

struct AppTabBarViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            AppTabBarView()
            AppTabBarView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
