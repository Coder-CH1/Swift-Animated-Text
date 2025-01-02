//
//  Extension.swift
//  Swift-Animated-Text
//
//  Created by Mac on 02/12/2024.
//

import UIKit

//MARK: - UIColor extension for blending/mixing array of colors -
extension UIColor {
    static func blend(colors: [UIColor]) -> UIColor {
        let numberOfColors = CGFloat(colors.count)
        var (red, green, blue, alpha) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        
        let componentsSum = colors.reduce((red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat())) { temp, color in
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return (temp.red+red, temp.green + green, temp.blue + blue, temp.alpha+alpha)
        }
        return UIColor(red: componentsSum.red / numberOfColors,
                       green: componentsSum.green / numberOfColors,
                       blue: componentsSum.blue / numberOfColors,
                       alpha: componentsSum.alpha / numberOfColors)
    }
}

//MARK: - Extension for animating background colors sequentially -
extension UIView {
    func animateBackgroundColor(to color: UIColor, duration: TimeInterval, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.backgroundColor = color
        }, completion: { _ in
            completion?()
        })
    }
    
    func animateColorsSequence(colors: [UIColor], duration: TimeInterval) {
        var delay: TimeInterval = 0
        
        for (_, color) in colors.enumerated() {
            let currentDuration = duration
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.animateBackgroundColor(to: color, duration: currentDuration) {
                    
                }
            }
            delay += currentDuration
        }
    }
}
