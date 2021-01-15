//
//  PlanetOrbit.swift
//  asteria alpha
//
//  Created by Elena Sadler on 1/13/21.
//

import SwiftUI

struct PlanetOrbit: View {
    let steps: Int = 3
    var lineWidth: CGFloat = 0.5
    var graphicSize: CGFloat
    
    private var stepGap: CGFloat {
        graphicSize * CGFloat(0.06)
    }
    
    
    var body: some View {
        let orbitFrameSize = CGFloat(Double(graphicSize) * 0.83)
        let planetFrameSize = CGFloat(Double(graphicSize) * 0.90)
        ZStack {
            //OrbitalLines
            CircleOrbitShape(steps: self.steps, stepGap: self.stepGap, lineWidth: self.lineWidth, frameSize: orbitFrameSize)
            //Planet circles
            PlanetShapeCircle(steps: self.steps, stepGap: self.stepGap, lineWidth: self.lineWidth, frameSize: planetFrameSize)
        }
        .frame(width: graphicSize, height: graphicSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

        
    }
}

struct PlanetShapeCircle: View {
    var steps: Int
    var stepGap: CGFloat
    var lineWidth: CGFloat
    var frameSize: CGFloat
    var body: some View {
        
        ForEach(0...steps, id: \.self) { idx in
            Circle()
                .fill(Color.black)
                .frame(width: 15, height: stepGap)
                .frame(maxHeight: .infinity, alignment: .topLeading)
                .padding(self.stepGap * CGFloat(idx) + self.lineWidth/2)
                .rotationEffect(.degrees(Double.random(in: 0..<360)))
        }.frame(width: frameSize, height: frameSize, alignment: .center)
    }
}

struct CircleOrbitShape: View {
    var steps: Int
    var stepGap: CGFloat
    var lineWidth: CGFloat
    var frameSize: CGFloat
    
    var body: some View {
        
        ForEach(0...steps, id: \.self) { idx in
            Group {
            Circle()
                .stroke(Color.black, lineWidth: self.lineWidth)
                .padding(self.stepGap * CGFloat(idx) + self.lineWidth/2)
            }            .frame(width: frameSize, height: frameSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
        
    }
}



struct PlanetOrbit_Previews: PreviewProvider {
    static var previews: some View {
        PlanetOrbit(graphicSize: 400)
            
    }
}
