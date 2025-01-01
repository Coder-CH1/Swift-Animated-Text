//
//  ViewController.swift
//  Swift-Animated-Text
//
//  Created by Mac on 02/12/2024.
//

import UIKit
//MARK: - UI -
class ViewController: UIViewController {
    
    //MARK: - LABEL -
    fileprivate lazy var firstAnimatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    //MARK: - LABEL -
    var secondAnimatedLabels: [UILabel] = []
    
    //MARK: - LIFE CYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        animateFirstLabel(text: "I Love UIKit...")
        animateSecondLabel(text: "I am a Mobile App Developer...")
    }
    
    //MARK: - METHOD TO ANIMATE FIRST LABEL -
    func animateFirstLabel(text label: String) {
        var currentIndex = 0
        let lenght = label.count
        
        firstAnimatedLabel.text = ""
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            if currentIndex < lenght {
                let index = label.index(label.startIndex, offsetBy: currentIndex)
                self.firstAnimatedLabel.text?.append(label[index])
                currentIndex += 1
            } else {
                timer.invalidate()
            }
        }
        setSubviewsAndLayout()
    }
    
    //MARK: - METHOD TO ANIMATE SECOND LABEL -
    func animateSecondLabel(text label: String) {
        let screenWidth = view.frame.width
        let numberOfCharacters = CGFloat(label.count)
        let width: CGFloat = screenWidth / numberOfCharacters
        let height: CGFloat = 40
        let startY: CGFloat = 200
        
        for (index, character) in label.enumerated() {
            let lbl = UILabel()
            lbl.text = String(character)
            lbl.font = UIFont.monospacedSystemFont(ofSize: 24, weight: .bold)
            lbl.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            lbl.frame = CGRect(x: CGFloat(index) * width, y: startY, width: width, height: height)
            lbl.textAlignment = .center
            lbl.adjustsFontSizeToFitWidth = true
            lbl.minimumScaleFactor = 0.5
            lbl.alpha = 0
            
            view.addSubview(lbl)
            secondAnimatedLabels.append(lbl)
            
            UIView.animate(withDuration: 0.7, delay: Double(index) * 0.3, options: .curveEaseOut, animations: {
                lbl.frame.origin.y = startY - 50
                lbl.alpha = 1
            }) {_ in
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                    lbl.frame.origin.y = startY
                })
            }
        }
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(firstAnimatedLabel)
        NSLayoutConstraint.activate([
            firstAnimatedLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            firstAnimatedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
