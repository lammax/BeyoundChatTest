//
//  GeometryModifier.swift
//  BeyondChat
//
//  Created by Mac on 12.08.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import SwiftUI

struct GeometryGetterMod: ViewModifier {

    @Binding var rect: CGSize

    func body(content: Content) -> some View {
        print(content)
        return GeometryReader { (g) -> Color in // (g) -> Content in - is what it could be, but it doesn't work
            DispatchQueue.main.async { // to avoid warning
                self.rect = g.frame(in: .global).size
                print(self.rect)
            }
            return Color.clear // return content - doesn't work
        }
    }
}
