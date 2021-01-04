//
//  PlacementView.swift
//  asteria alpha
//
//  Created by Elena Sadler on 1/3/21.
//

import SwiftUI

struct PlacementView: View {
    var planet_list: [Planet]
    var circle_size: Int
    var body: some View {
        let planets: [String: Planet] = ["Sun": planet_list[0], "Moon": planet_list[1], "Mercury": planet_list[2], "Venus": planet_list[3], "Mars": planet_list[4], "Jupiter": planet_list[5], "Saturn": planet_list[6], "Uranus": planet_list[7], "Neptune": planet_list[8], "Pluto": planet_list[9]]
        Group {
            PlanetView(planet_data: planets["Sun"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Moon"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Mercury"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Venus"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Mars"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Jupiter"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Saturn"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Uranus"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Neptune"]!, circle_size: circle_size)
            PlanetView(planet_data: planets["Pluto"]!, circle_size: circle_size)
        }
        
        
    }
}


struct PlanetView: View {
    var planet_data: Planet
    var circle_size: Int
    var body: some View {
        Group {
            PlanetLineView(planet_data: planet_data, circle_size: circle_size)
            PlanetSymbolView(planet_data: planet_data, circle_size: circle_size)
            PlanetDegreeView(planet_data: planet_data, circle_size: circle_size)
        }
    }
}


struct PlanetSymbolView: View {
    var planet_data: Planet
    var circle_size: Int
    var body: some View {
        let planet_symbol = planet_data.planet_symbol
        let circle_position = Double(planet_data.circle_position)
        let radius = CGFloat((circle_size/2) - 65)
        CurvedText(text: planet_symbol, radius: radius)
            .rotationEffect(.degrees(circle_position))
            .font(.system(size: 20, weight: .regular, design: .monospaced))
    }
}

struct PlanetDegreeView: View {
    var planet_data: Planet
    var circle_size: Int
    var body: some View {
        let planet_degree = planet_data.actual_position
        let circle_position = Double(planet_data.circle_position)
        let radius = CGFloat((circle_size/2) - 90)
        CurvedText(text: "\(planet_degree)°", radius: radius)
            .rotationEffect(.degrees(circle_position))
            .font(.system(size: 10, weight: .light, design: .monospaced))
    }
}

struct PlanetLineView: View {
    var planet_data: Planet
    var circle_size: Int
    var body: some View {
        let circle_position = Double(planet_data.circle_position)
        let radius = CGFloat((circle_size/2) - 60)
        CurvedText(text: "|", radius: radius)
            .rotationEffect(.degrees(circle_position))
            .font(.system(size: 5, weight: .bold, design: .monospaced))
    }
}
