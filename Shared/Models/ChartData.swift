//
//  ChartData.swift
//  asteria alpha
//
//  Created by Elena Sadler on 1/1/21.
//

import Foundation

struct ChartData: Codable {
    let house_data: HouseSignOrder
    let planet_data: [Planet]
    let axis_lines: [AxisLine]
    let aspect_list: [Aspect]
}

struct Planet: Codable {
    let planet_name: String
    let planet_sign: String
    let actual_position: Int
    let circle_position: Int
    let planet_symbol: String
}

struct AxisLine: Codable {
    let name: String
    let actual_position: Int
    let circle_position: Int
}

struct HouseSignOrder: Codable {
    let first_house: House
    let second_house: House
    let third_house: House
    let fourth_house: House
    let fifth_house: House
    let sixth_house: House
    let seventh_house: House
    let eighth_house: House
    let ninth_house: House
    let tenth_house: House
    let eleventh_house: House
    let twelfth_house: House
    
}

struct Aspect: Codable {
    let planet_one_name: String
    let planet_two_name: String
    let aspect_name: String
    let aspect_orb: Int
    let aspect_aid: Int
}

struct House: Codable {
    let sign: String
    let center_position: Int
    let sign_emoji: String
    let house_digit: String
}


