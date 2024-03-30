//
//  UIExtensions.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-22.
//

import SwiftUI

enum KumbhaSans: String {
    case regular = "KumbhaSans-Regular"
    case medium = "KumbhaSans-Medium"
    case semibold = "KumbhaSans-SemiBold"
    case bold = "KumbhaSans-Bold"
    case extrablod = "KumbhaSans-ExtraBold"
    case thin = "KumbhaSans-Thin"
    case light = "KumbhaSans-Light"
    case extralight = "KumbhaSans-ExtraLight"
    case black = "black"
}

extension Font {
    
    static func customfont(_ font: KumbhaSans, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
}

extension Color {
    
    static var primaryApp: Color {
        return Color(hex: "fffff")
    }
    
    static var primaryText: Color {
        return Color(hex: "030303")
    }
    
    static var secondaryText: Color {
        return Color(hex: "828282")
    }
    
    static var textTitle: Color {
        return Color(hex: "7C7C7C")
    }
    
    static var placeholder: Color {
        return Color(hex: "B1B1B1")
    }
    
    static var darkGray: Color {
        return Color(hex: "4C4F4D")
        
    }
    
    static var lightpink: Color {
        return Color(hex: "ecc3c3")
    }
    
    static var pink: Color {
        return Color(hex: "ea9999")
    }
    
    static var lightorange: Color {
        return Color(hex: "f7b97a")
    }
    
    static var Default: Color {
           return Color(hex: "A97B0B")
       }
    
    
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
                case 3: // RGB(12 -bit)
                    (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
                case 6: // RGB (24-bit)
                    (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
                case 8: // ARGB (32-bit)
                    (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
                default:
                    (a, r, g, b) = (1, 1, 1, 0)
            }
            
            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
}

struct ShowButton: ViewModifier {
    @Binding var isShow: Bool
    
    public func body(content: Content) -> some View {
        
        HStack {
            content
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill" )
                    .foregroundColor(.textTitle)
            }

        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner:  UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corers: corner))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corers: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corers, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
