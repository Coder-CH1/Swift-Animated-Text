//
//  Extension.swift
//  Swift-Animated-Text
//
//  Created by Mac on 02/12/2024.
//

import UIKit

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
