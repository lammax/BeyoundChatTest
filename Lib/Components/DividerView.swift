//
//  DividerView.swift
//  BeyondChat
//
//  Created by Mac on 12.08.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import SwiftUI

struct DividerView: View {
    
    let color: Color
    
    var body: some View {
        HStack {
            Spacer()
        }
        .frame(height: 1)
        .background(color)
    }
    
}
