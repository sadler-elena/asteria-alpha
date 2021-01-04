//
//  ChartBase.swift
//  asteria alpha (iOS)
//
//  Created by Elena Sadler on 1/2/21.
//

import SwiftUI

struct ChartBase: View {
    var chart: ChartData
    var size: Int
    
    var body: some View {
        let ac = (Double(chart.axis_lines[0].circle_position))
        let ic = (Double(chart.axis_lines[1].circle_position))
        let dc = (Double(chart.axis_lines[2].circle_position))
        let mc = (Double(chart.axis_lines[3].circle_position))
        let chart_size = CGFloat(size)
        let house_data = chart.house_data
        let planet_data = chart.planet_data
        
        
        ZStack {
        ChartCircle(acLine: .degrees(ac), icLine: .degrees(ic), dcLine: .degrees(dc), mcLine: .degrees(mc))
            .frame(width: chart_size, height: chart_size)
            
            HouseSignView(house_info: house_data, circle_size: size)
            
            PlacementView(planet_list: planet_data, circle_size: size)
                
            
        }



    }
}


