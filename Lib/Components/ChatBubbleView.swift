//
//  ChatBubble.swift
//  BeyondChat
//
//  Created by Mac on 12.08.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import SwiftUI

struct ChatBubbleView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var bubbleOpacity: Double = 0.0
    
    let chatLine: ChatLine
    let isLast: Bool
    
    private let calloutSize: CGSize = CGSize(width: 11, height: 18)
    private let appearAnim: (()->()) -> Void = { withAnimation(.linear(duration: 0.5), $0) }
    
    var body: some View {
        HStack {
            Text(chatLine.line.prefix(550))
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .font(.callout)
                .foregroundColor(.black)
                .padding(10)
                .background(Color.chatBubbleBack)
                .cornerRadius(5.0)
                .shadow(color: shadowColor.opacity(0.5), radius: 4, x: 1, y: 1)
                .opacity(bubbleOpacity)
                //.transition(.slide)
                
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.75)
        .onAppear {
            if self.isLast {
                self.appearAnim({ self.bubbleOpacity = 1.0 })
            } else {
                self.bubbleOpacity = 1.0
            }
        }
    }
    
    var shadowColor: Color {
        colorScheme == .dark ? Color.gray : Color.black
    }
    
}

struct CallOutTailView: View {
    
    let calloutSize: CGSize
    
    var body: some View {
        Path { path in
            path.move(
                to: CGPoint(
                    x: calloutSize.width,
                    y: .zero
                )
            )
            
            path.addLine(
                to: .init(
                    x: 3,
                    y: calloutSize.height - 3
                )
            )
            
            path.addQuadCurve(
                to: .init(
                    x: 5,
                    y: calloutSize.height
                ),
                control: .init(
                    x: 1.5,
                    y: calloutSize.height - 1.5
                )
            )
            
            path.addLine(
                to: .init(
                    x: calloutSize.width,
                    y: calloutSize.height
                )
            )
            
            path.addLine(
                to: .init(
                    x: calloutSize.width,
                    y: .zero
                )
            )
        }
        .fill(Color.chatBubbleBack)
    }
}
