//
//  PolygonShape.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 16/09/23.
//

import SwiftUI

struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.03337*width, y: 0.53897*height))
        path.addCurve(to: CGPoint(x: 0.02742*width, y: 0.43214*height), control1: CGPoint(x: 0.02839*width, y: 0.4835*height), control2: CGPoint(x: 0.02604*width, y: 0.45695*height))
        path.addCurve(to: CGPoint(x: 0.14168*width, y: 0.19309*height), control1: CGPoint(x: 0.03249*width, y: 0.34106*height), control2: CGPoint(x: 0.07342*width, y: 0.25542*height))
        path.addCurve(to: CGPoint(x: 0.22938*width, y: 0.12886*height), control1: CGPoint(x: 0.16028*width, y: 0.17611*height), control2: CGPoint(x: 0.18263*width, y: 0.1608*height))
        path.addCurve(to: CGPoint(x: 0.32124*width, y: 0.07043*height), control1: CGPoint(x: 0.27614*width, y: 0.09692*height), control2: CGPoint(x: 0.29852*width, y: 0.08167*height))
        path.addCurve(to: CGPoint(x: 0.59057*width, y: 0.04744*height), control1: CGPoint(x: 0.40462*width, y: 0.02917*height), control2: CGPoint(x: 0.50111*width, y: 0.02093*height))
        path.addCurve(to: CGPoint(x: 0.69143*width, y: 0.08943*height), control1: CGPoint(x: 0.61494*width, y: 0.05466*height), control2: CGPoint(x: 0.6397*width, y: 0.06589*height))
        path.addCurve(to: CGPoint(x: 0.78924*width, y: 0.13782*height), control1: CGPoint(x: 0.74316*width, y: 0.11296*height), control2: CGPoint(x: 0.7679*width, y: 0.12424*height))
        path.addCurve(to: CGPoint(x: 0.9443*width, y: 0.35388*height), control1: CGPoint(x: 0.86755*width, y: 0.18763*height), control2: CGPoint(x: 0.92311*width, y: 0.26504*height))
        path.addCurve(to: CGPoint(x: 0.95747*width, y: 0.46009*height), control1: CGPoint(x: 0.95008*width, y: 0.37808*height), control2: CGPoint(x: 0.95249*width, y: 0.40462*height))
        path.addCurve(to: CGPoint(x: 0.96341*width, y: 0.56692*height), control1: CGPoint(x: 0.96244*width, y: 0.51557*height), control2: CGPoint(x: 0.96479*width, y: 0.54211*height))
        path.addCurve(to: CGPoint(x: 0.84915*width, y: 0.80597*height), control1: CGPoint(x: 0.95834*width, y: 0.658*height), control2: CGPoint(x: 0.91741*width, y: 0.74365*height))
        path.addCurve(to: CGPoint(x: 0.76145*width, y: 0.8702*height), control1: CGPoint(x: 0.83056*width, y: 0.82295*height), control2: CGPoint(x: 0.80821*width, y: 0.83826*height))
        path.addCurve(to: CGPoint(x: 0.66959*width, y: 0.92864*height), control1: CGPoint(x: 0.71469*width, y: 0.90214*height), control2: CGPoint(x: 0.69231*width, y: 0.9174*height))
        path.addCurve(to: CGPoint(x: 0.40026*width, y: 0.95162*height), control1: CGPoint(x: 0.58621*width, y: 0.9699*height), control2: CGPoint(x: 0.48972*width, y: 0.97813*height))
        path.addCurve(to: CGPoint(x: 0.2994*width, y: 0.90964*height), control1: CGPoint(x: 0.37589*width, y: 0.9444*height), control2: CGPoint(x: 0.35113*width, y: 0.93317*height))
        path.addCurve(to: CGPoint(x: 0.2016*width, y: 0.86124*height), control1: CGPoint(x: 0.24767*width, y: 0.8861*height), control2: CGPoint(x: 0.22293*width, y: 0.87482*height))
        path.addCurve(to: CGPoint(x: 0.04653*width, y: 0.64518*height), control1: CGPoint(x: 0.12328*width, y: 0.81143*height), control2: CGPoint(x: 0.06772*width, y: 0.73402*height))
        path.addCurve(to: CGPoint(x: 0.03337*width, y: 0.53897*height), control1: CGPoint(x: 0.04075*width, y: 0.62098*height), control2: CGPoint(x: 0.03834*width, y: 0.59444*height))
        path.closeSubpath()
        return path
    }
}
