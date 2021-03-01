//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

/*idea: one of those bars where it has three stars
 like if it's out of 10, it might have the stars at 6, 8, and 10
 (or positioned at the 100%, 66%, and 33% points)
 and if you got 7, it would load to 7, and you'd get 1 star
 and when it reaches a star, the star turns from grey to yellow and expands
 */

import SwiftUI

struct CustomComposableView: View {
    
    // percent completed/correct
    @State var score: CGFloat
    
    //horizontal offset
    @State var offsetX: CGFloat = 0
    
    //controls the size of the different stars
    @State var starScaleA: CGFloat = 0
    @State var starScaleB: CGFloat = 0
    @State var starScaleC: CGFloat = 0
    
    //controls the color of the stars
    @State var starColorA: Color = Color.gray
    @State var starColorB: Color = Color.gray
    @State var starColorC: Color = Color.gray
    
    struct Star: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0.5 * rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0.65 * rect.width, y: 0.3 * rect.height))
            path.addLine(to: CGPoint(x: 0.975 * rect.width, y: 0.35 * rect.height))
            path.addLine(to: CGPoint(x: 0.75 * rect.width, y: 0.575 * rect.height))
            path.addLine(to: CGPoint(x: 0.8 * rect.width, y: 0.9 * rect.height))
            path.addLine(to: CGPoint(x: 0.5 * rect.width, y: 0.75 * rect.height))
            path.addLine(to: CGPoint(x: 0.2 * rect.width, y: 0.9 * rect.height))
            path.addLine(to: CGPoint(x: 0.25 * rect.width, y: 0.575 * rect.height))
            path.addLine(to: CGPoint(x: 0.025 * rect.width, y: 0.35 * rect.height))
            path.addLine(to: CGPoint(x: 0.35 * rect.width, y: 0.3 * rect.height))
            path.addLine(to: CGPoint(x: 0.35 * rect.width, y: 0.3 * rect.height))
            
            return path
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .frame(width: (geometry.size.width - 30), height: 30, alignment: .leading)
                    Rectangle()
                        .fill(Color.primary)
                        .colorInvert()
                        .frame(width: (geometry.size.width - 30), height: 30)
                        .offset(x: offsetX)
                        .onAppear {
                            withAnimation(.linear(duration: (2 * Double(score) / 100))) {
                                offsetX = (geometry.size.width - 30) / 100 * score
                            }
                        }
                    HStack{
                        Star()
                            .scaleEffect(starScaleA)
                            .foregroundColor(starColorA)
                            .offset(x: (geometry.size.width - 30)/6)
                            .onAppear {
                                withAnimation(Animation.linear(duration: 0.25).delay(0.5)) {
                                    if score > 33 {
                                    starScaleA = 0.35
                                    starColorA = Color.yellow
                                    }
                                }
                            }
                        Star()
                            .scaleEffect(starScaleB)
                            .foregroundColor(starColorB)
                            .offset(x: (geometry.size.width - 30)/6)
                            .onAppear {
                                withAnimation(Animation.linear(duration: 0.25).delay(1.17)) {
                                    if score > 67 {
                                    starScaleB = 0.35
                                    starColorB = Color.yellow
                                    }
                                }
                            }
                        Star()
                            .scaleEffect(starScaleC)
                            .foregroundColor(starColorC)
                            .offset(x: (geometry.size.width - 30)/12)
                            .onAppear {
                                withAnimation(Animation.linear(duration: 0.25).delay(1.84)) {
                                    if score == 100 {
                                    starScaleC = 0.35
                                    starColorC = Color.yellow
                                    }
                                }
                            }
                    }
                }
                Spacer()
            }
        }
    }
}
