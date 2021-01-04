//
//  NumberCircle.swift
//  asteria alpha (iOS)
//
//  Created by Elena Sadler on 1/2/21.
//

import SwiftUI

struct HouseSignView: View {
    var house_info: HouseSignOrder
    var circle_size: Int
    var body: some View {
        let house_list = [house_info.first_house, house_info.second_house, house_info.third_house, house_info.fourth_house, house_info.fifth_house, house_info.sixth_house, house_info.seventh_house, house_info.eighth_house, house_info.ninth_house, house_info.tenth_house, house_info.eleventh_house, house_info.twelfth_house]
        Group {
            HouseView(house_info: house_list[0], circle_size: circle_size)
            HouseView(house_info: house_list[1], circle_size: circle_size)
            HouseView(house_info: house_list[2], circle_size: circle_size)
            HouseView(house_info: house_list[3], circle_size: circle_size)
            HouseView(house_info: house_list[4], circle_size: circle_size)
            HouseView(house_info: house_list[5], circle_size: circle_size)
            }
        Group {
            HouseView(house_info: house_list[6], circle_size: circle_size)
            HouseView(house_info: house_list[7], circle_size: circle_size)
            HouseView(house_info: house_list[8], circle_size: circle_size)
            HouseView(house_info: house_list[9], circle_size: circle_size)
            HouseView(house_info: house_list[10], circle_size: circle_size)
            HouseView(house_info: house_list[11], circle_size: circle_size)
        }
        }

    }


struct HouseView: View {
    var house_info: House
    var circle_size: Int
    var body: some View {
        Group {
            HouseNumberText(house_info: house_info, circle_size: circle_size)
            HouseSignEmoji(house_info: house_info, circle_size: circle_size)
        }
    }
}

struct HouseNumberText: View {
    var house_info: House
    var circle_size: Int
    var body: some View {
        let house_digit = house_info.house_digit
        let center_position = Double(house_info.center_position)
        let radius = CGFloat((circle_size/2) - 40)
        CurvedText(text: house_digit, radius: radius)
            .rotationEffect(.degrees(center_position))
            .font(.caption)
    }
}

struct HouseSignEmoji: View {
    var house_info: House
    var circle_size: Int
    var body: some View {
        let sign_emoji = house_info.sign_emoji
        let center_position = Double(house_info.center_position)
        let radius = CGFloat((circle_size/2) - 5)
        CurvedText(text: sign_emoji, radius: radius)
            .rotationEffect(.degrees(center_position))
    }
}



