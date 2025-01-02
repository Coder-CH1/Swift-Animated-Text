//
//  SceneDelegate.swift
//  Swift-Animated-Text
//
//  Created by Mac on 02/12/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        let rootViewController = ViewController()
        window?.rootViewController = rootViewController
        
        let colors: [UIColor] = [#colorLiteral(red: 0.3952487111, green: 0.07191131264, blue: 0.09358521551, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.03250751629, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.2949430026, green: 0.06731580187, blue: 0.03667572662, alpha: 1), #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), #colorLiteral(red: 0.008313905943, green: 0.2409412944, blue: 0.2374770158, alpha: 1), #colorLiteral(red: 0.09688199984, green: 0.1477390103, blue: 0.686814635, alpha: 1), #colorLiteral(red: 0.770552591, green: 0.5610343851, blue: 0.3119159791, alpha: 1)]
        window?.animateColorsSequence(colors: colors, duration: 1.0)
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

