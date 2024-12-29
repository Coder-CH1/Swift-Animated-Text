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
    fileprivate lazy var animatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    //MARK: - LIFE CYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLabel(text: "I Love UIKit...")
    }
    
    //MARK: - METHOD TO ANIMATE LABEL -
    func animateLabel(text label: String) {
        var currentIndex = 0
        let lenght = label.count
        
        animatedLabel.text = ""
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            if currentIndex < lenght {
                let index = label.index(label.startIndex, offsetBy: currentIndex)
                self.animatedLabel.text?.append(label[index])
                currentIndex += 1
            } else {
                timer.invalidate()
            }
        }
        setSubviewsAndLayout()
    }
   
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(animatedLabel)
        NSLayoutConstraint.activate([
            animatedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            animatedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
