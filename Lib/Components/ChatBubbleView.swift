//
//  ChatBubble.swift
//  BeyondChat
//
//  Created by Mac on 12.08.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation
import SwiftUI

struct ChatBubbleView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var bubbleOpacity: Double = 0.0
    
    let chatLine: ChatLine
    let isLast: Bool
    
    private let appearAnim: (()->()) -> Void = { withAnimation(.linear(duration: 0.5), $0) }
    
    var body: some View {
        HStack {
            Text(chatLine.line.prefix(550))
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .font(.callout)
                .foregroundColor(.black)
                .padding(.vertical, 10)
                //.padding(.trailing, 15)
                .padding(.leading, 17)
                .background(CallOutBubbleView())
                .opacity(bubbleOpacity)
                
                
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

struct ChatBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleView(chatLine: ChatLine(line: "dialogue line 1\ndialogue line 2"), isLast: false)
    }
}


struct CallOutBubbleView: View {
    
    @Environment(\.colorScheme) var colorScheme

    private let calloutSize: CGSize = CGSize(width: 15, height: 18)
    private let cornerRadius: CGFloat = 5
    private let radiusOffset: CGFloat = pow(25/2.0, 0.5)

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(
                    to: .init(
                        x: self.calloutSize.width,
                        y: self.cornerRadius
                    )
                )
                
                path.addLine(
                    to: .init(
                        x: self.calloutSize.width,
                        y: geometry.size.height - self.calloutSize.height - self.cornerRadius
                    )
                )
                
                path.addQuadCurve(
                    to: .init(
                        x: self.cornerRadius,
                        y: geometry.size.height - self.cornerRadius*1.3
                    ),
                    control: .init(
                        x: self.calloutSize.width ,
                        y: geometry.size.height - self.calloutSize.height
                    )
                )

                path.addQuadCurve(
                    to: .init(
                        x: self.cornerRadius,
                        y: geometry.size.height
                    ),
                    control: .init(
                        x: .zero,
                        y: geometry.size.height - self.cornerRadius/4.0
                    )
                )
                
                path.addLine(
                    to: .init(
                        x: geometry.size.width + self.calloutSize.width - self.cornerRadius,
                        y: geometry.size.height
                    )
                )

                path.addQuadCurve(
                    to: .init(
                        x: geometry.size.width + self.calloutSize.width,
                        y: geometry.size.height - self.cornerRadius
                    ),
                    control: .init(
                        x: geometry.size.width + self.calloutSize.width,
                        y: geometry.size.height
                    )
                )
                
                path.addLine(
                    to: .init(
                        x: geometry.size.width + self.calloutSize.width,
                        y: self.cornerRadius
                    )
                )

                path.addQuadCurve(
                    to: .init(
                        x: geometry.size.width + self.calloutSize.width - self.cornerRadius,
                        y: .zero
                    ),
                    control: .init(
                        x: geometry.size.width + self.calloutSize.width,
                        y: .zero
                    )
                )
                
                path.addLine(
                    to: .init(
                        x: self.calloutSize.width + self.cornerRadius,
                        y: .zero
                    )
                )

                path.addQuadCurve(
                    to: .init(
                        x: self.calloutSize.width,
                        y: self.cornerRadius
                    ),
                    control: .init(
                        x: self.calloutSize.width,
                        y: .zero
                    )
                )

                path.closeSubpath()
            }
            .fill(Color.green)//(Color.chatBubbleBack)
            .frame(width: geometry.size.width + self.calloutSize.width, height: geometry.size.height)
            .shadow(color: self.shadowColor.opacity(0.5), radius: 4, x: -1, y: 1)
        }

    }
    
    var shadowColor: Color {
        colorScheme == .dark ? Color.gray : Color.black
    }

}
