//
//  UIColor.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 11/25/19.
//  
//

public extension UIColor {
    /**
    Init UIColor with HEX components
    */
    static func hex(string: String, alpha: CGFloat = 1) -> UIColor? {
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
        
        return UIColor(red: (red.f/255), green: (green.f/255), blue: (blue.f/255), alpha: alpha)
    }

    private static func hexValueToUnsigned(hexValue: String) -> UInt64 {
        var value: UInt64 = 0
        let hexScanner = Scanner(string: hexValue)
        hexScanner.scanHexInt64(&value)
        return value
    }
    
    static func hsba(_ h: CGFloat, _ s: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
    }
    
    /**
    Init UIColor with RGB components
    */
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    /**
    Decomposes UIColor to its RGB components
    */
    var rgbColor: UIColor {
        get {
            var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
    }

    /**
     Decomposes UIColor to its HSBA components
     */
    var hsbColor: UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
    }
}
