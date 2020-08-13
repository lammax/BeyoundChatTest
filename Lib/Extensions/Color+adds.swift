//
//  Color+adds.swift
//  BeyondChat
//
//  Created by Mac on 12.08.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import SwiftUI

extension Color {
   
   init(hex: String) {
       let filteredHex = hex.filter { "0123456789ABCDEF".contains($0.uppercased())}
       let scanner = Scanner(string: filteredHex)
       scanner.scanLocation = 0

       var rgbValue: UInt64 = 0

       scanner.scanHexInt64(&rgbValue)

       let r = (rgbValue & 0xff0000) >> 16
       let g = (rgbValue & 0xff00) >> 8
       let b = rgbValue & 0xff

       self.init(
           red: Double(r) / 0xff,
           green: Double(g) / 0xff,
           blue: Double(b) / 0xff, opacity: 1
       )
   }
   
   init(hex: Int, opacity: Double = 1.0) {
       let red = (hex & 0xFF0000) >> 16
       let green = (hex & 0xFF00) >> 8
       let blue = hex & 0xFF
       
       self.init(red: Double(red) / 0xff, green: Double(green) / 0xff, blue: Double(blue) / 0xff, opacity: opacity)
   }
   
   static let chatViewBack =  Color(hex: "F9FAFB")
   static let chatBubbleBack =  Color(hex: "FDFDFE")
   static let darkGray = Color(hex: "2A2B2D")

}
