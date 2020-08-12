//
//  ComonSettings.swift
//  BeyondChat
//
//  Created by Mac on 12.08.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation
import Combine

class CommonSettings: ObservableObject {
    
    @Published var chatData: Data?
    
    var textLinesNum: Int = 3
    
    init() {
        self.makeDummyChatTexts()
    }
    
    func makeDummyChatTexts() {
        let chatModel: Chat = Chat(lines:
            (1...textLinesNum).reduce(into: [], { $0.append(ChatLine(line: "dialogue line \($1)")) })
        )
        
        let encoder = JSONEncoder()
        self.chatData = try? encoder.encode(chatModel)
    }
}
