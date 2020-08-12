//
//  ChatModel.swift
//  BeyondChat
//
//  Created by Mac on 12.08.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation

struct Chat: Codable {
    let lines: [ChatLine]
}

struct ChatLine: Codable, Hashable {
    let line: String
}
