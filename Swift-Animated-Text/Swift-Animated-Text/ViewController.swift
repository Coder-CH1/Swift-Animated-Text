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
        label.textColor = .white
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
        animateSecondLabel(text: "I Love iOS...")
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
        let width: CGFloat = 30
        let height: CGFloat = 40
        let startY: CGFloat = 200
        
        for (index, character) in label.enumerated() {
            let lbl = UILabel()
            lbl.text = String(character)
            lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            lbl.textColor = .white
            lbl.frame = CGRect(x: -50, y: startY, width: width, height: height)
            
            view.addSubview(lbl)
            
            secondAnimatedLabels.append(lbl)
            
            UIView.animate(withDuration: 0.7, delay: Double(index) * 0.3, options: .curveEaseOut) {
                lbl.frame.origin.x = CGFloat(10 + index * Int(width))
            }
        }
    }

    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(firstAnimatedLabel)
        NSLayoutConstraint.activate([
            firstAnimatedLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            firstAnimatedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
