//
//  Extensions.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 28.03.2022.
//

import Foundation
import UIKit


extension UIImage {

    func applyColorMask(color: UIColor, context: CIContext) -> UIImage {

        guard let cgImageInput = self.cgImage else {
            print("applyColorMask: \(self) has no cgImage attribute.")
            return self
        }

        // Throw away existing colors, and fill the non transparent pixels with the input color
        // s.r = dot(s, redVector), s.g = dot(s, greenVector), s.b = dot(s, blueVector), s.a = dot(s, alphaVector)
        // s = s + bias
        let colorFilter = CIFilter(name: "CIColorMatrix")!
        let ciColorInput = CIColor(cgColor: color.cgColor)
        colorFilter.setValue(CIVector(x: 0, y: 0, z: 0, w: 0), forKey: "inputRVector")
        colorFilter.setValue(CIVector(x: 0, y: 0, z: 0, w: 0), forKey: "inputGVector")
        colorFilter.setValue(CIVector(x: 0, y: 0, z: 0, w: 0), forKey: "inputBVector")
        colorFilter.setValue(CIVector(x: 0, y: 0, z: 0, w: 1), forKey: "inputAVector")
        colorFilter.setValue(CIVector(x: ciColorInput.red, y: ciColorInput.green, z: ciColorInput.blue, w: 0), forKey: "inputBiasVector")
        colorFilter.setValue(CIImage(cgImage: cgImageInput), forKey: kCIInputImageKey)

        if let cgImageOutput = context.createCGImage(colorFilter.outputImage!, from: colorFilter.outputImage!.extent) {
            return UIImage(cgImage: cgImageOutput)
        } else {
            print("applyColorMask: failed to apply filter to \(self)")
            return self
        }
    }
}
extension UIColor {
    convenience init(hexCode: String) {
        let hex = hexCode.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

