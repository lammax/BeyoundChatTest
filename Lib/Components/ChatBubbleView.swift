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
    
    let chatLine: ChatLine
    
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
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.75)
    }
    
    var shadowColor: Color {
        colorScheme == .dark ? Color.gray : Color.black
    }

}
