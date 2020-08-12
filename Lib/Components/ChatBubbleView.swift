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
        Text(chatLine.line)
            .font(.callout)
            .foregroundColor(.black)
            .padding(10)
            .background(Color.chatBubbleBack)
            .cornerRadius(5.0)
            .shadow(color: shadowColor.opacity(0.5), radius: 4, x: 1, y: 1)
    }
    
    var shadowColor: Color {
        colorScheme == .dark ? Color.white : Color.black
    }

}
