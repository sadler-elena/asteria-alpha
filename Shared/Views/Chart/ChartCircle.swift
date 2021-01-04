//
//  ChartCircle.swift
//  asteria alpha (iOS)
//
//  Created by Elena Sadler on 1/2/21.
//

import SwiftUI

struct ChartCircle: View {
    let steps: Int = 2
    var stepGap: CGFloat = 30
    var lineWidth: CGFloat = 3
    var divisions: Int = 12
    var acLine: Angle = .zero
    var icLine: Angle = .zero
    var dcLine: Angle = .zero
    var mcLine: Angle = .zero

    private var gapSpan: CGFloat {
        CGFloat(stepGap) * CGFloat(steps)
    }

    var body: some View {
        ZStack {
            Group {
                ForEach(0...steps, id: \.self) { idx in
                    Circle()
                        .stroke(lineWidth: self.lineWidth)
                        .padding(self.stepGap * CGFloat(idx) + self.lineWidth/2)
                }

                ForEach(0..<divisions, id: \.self) { idx in
                    RoundedRectangle(cornerRadius: self.lineWidth / 2)
                        .frame(width: self.lineWidth,
                               height: self.gapSpan + self.lineWidth)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .rotationEffect(self.linesRotation(at: idx))
                }
            }
            .foregroundColor(Color(.separator))
            AxisLineView(axisDegree: acLine, lineWidth: lineWidth, gapSpan: gapSpan)
            AxisLineView(axisDegree: icLine, lineWidth: lineWidth, gapSpan: gapSpan)
            AxisLineView(axisDegree: dcLine, lineWidth: lineWidth, gapSpan: gapSpan)
            AxisLineView(axisDegree: mcLine, lineWidth: lineWidth, gapSpan: gapSpan)
            
            
        }
    }

    private func linesRotation(at index: Int) -> Angle {
        .init(degrees: 360 / Double(divisions) * Double(index))
    }
}



struct AxisLineView: View {
    var axisDegree: Angle
    var lineWidth: CGFloat
    var gapSpan: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: CGFloat(lineWidth) / 2)
            .frame(width: CGFloat(lineWidth),
                   height: gapSpan + CGFloat(lineWidth))
            .frame(maxHeight: .infinity, alignment: .top)
            .rotationEffect(axisDegree)
            .foregroundColor(Color(.black))
 
    }
    
}
