//
//  customShapes.swift
//  ComposableViewsAndAnimations
//
//  Created by Harris-Stoertz, Rowan on 2021-02-26.
//

import Foundation

struct Star: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //defining points based on coordinates found by drawing star on graph paper
        let A = CGPoint (x: 0.5 * rect.width, y: 0)
        let B = CGPoint (x: 0.65 * rect.width, y: 0.3 * rect.height)
        let C = CGPoint (x: 0.975 * rect.width, y: 0.35 * rect.height)
        let D = CGPoint (x: 0.75 * rect.width, y: 0.575 * rect.height)
        let E = CGPoint (x: 0.8 * rect.width, y: 0.9 * rect.height)
        let F = CGPoint (x: 0.5 * rect.width, y: 0.75 * rect.height)
        let G = CGPoint (x: 0.2 * rect.width, y: 0.9 * rect.height)
        let H = CGPoint (x: 0.25 * rect.width, y: 0.575 * rect.height)
        let I = CGPoint (x: 0.025 * rect.width, y: 0.35 * rect.height)
        let J = CGPoint (x: 0.35 * rect.width, y: 0.3 * rect.height)
        //instructions for it to move between the points in order
        path.move(to: A)
        path.addLine(to: B)
        path.addLine(to: C)
        path.addLine(to: D)
        path.addLine(to: E)
        path.addLine(to: F)
        path.addLine(to: G)
        path.addLine(to: H)
        path.addLine(to: I)
        path.addLine(to: J)
        path.addLine(to: A)
        return path
    }
}
