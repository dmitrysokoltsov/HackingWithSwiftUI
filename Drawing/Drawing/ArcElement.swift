//
//  ArcElement.swift
//  Drawing
//
//  Created by Dmitry Sokoltsov on 06.07.2022.
//

import SwiftUI

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insertAmount: CGFloat = 0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var ark = self
        ark.insertAmount += amount
        
        return ark
    }
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2 - insertAmount,
                    startAngle: modifiedStart,
                    endAngle: modifiedEnd,
                    clockwise: !clockwise)
        
        return path
    }
}

struct ArcElement: View {
    var body: some View {
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct ArcElement_Previews: PreviewProvider {
    static var previews: some View {
        ArcElement()
    }
}
