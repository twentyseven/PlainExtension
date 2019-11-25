//
//  UIColor.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//  
//

public extension UIColor {
    static func withHex(string: String, alpha: CGFloat = 1) -> UIColor? {
        guard !string.isEmpty else { return nil }
        var hex = string
        if hex[0] != "#" {
            hex = "#\(string)"
        }
        if hex.count != 7, hex.count != 4 {
            #if DEBUG
            print("Unsupported string format: %@", hex);
            #endif
            return nil
        }
        if hex.count == 4 {
            hex = "#\(hex[1])\(hex[1])\(hex[2])\(hex[2])\(hex[3])\(hex[3])"
        }
        let redHex = "0x\(hex[1])\(hex[2])"
        let red = Self.hexValueToUnsigned(hexValue: redHex)

        let greenHex = "0x\(hex[3])\(hex[4])"
        let green = Self.hexValueToUnsigned(hexValue: greenHex)

        let blueHex = "0x\(hex[5])\(hex[6])"
        let blue = Self.hexValueToUnsigned(hexValue: blueHex)
        
        return UIColor(red: (red/255).f, green: (green/255).f, blue: (blue/255).f, alpha: alpha)
    }

    private static func hexValueToUnsigned(hexValue: String) -> UInt64 {
        var value: UInt64 = 0
        let hexScanner = Scanner(string: hexValue)
        hexScanner.scanHexInt64(&value)
        return value
    }
}
