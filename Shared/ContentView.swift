//
//  ContentView.swift
//  Shared
//
//  Created by Elena Sadler on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    let chart = Bundle.main.decode("Elena2.json")
    var body: some View {
        ChartBase(chart: chart, size: 400)
            .rotationEffect(.degrees(15))

    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
