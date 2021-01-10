//
//  SplashViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 10.01.2021.
//

import UIKit
import Lottie

enum DownloadKeyFrames: CGFloat {
    case start = 0
    case end = 21
}

class SplashViewController: UIViewController {

    let animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimation()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil )
        let mainVK = storyboard.instantiateViewController(identifier: "TabBar")
        mainVK.modalPresentationStyle = .fullScreen
            mainVK.modalTransitionStyle = .crossDissolve
        self.present(mainVK, animated: true)
        }
        
    }
    
    func setupAnimation() {
        animationView.animation = Animation.named("bike")
        animationView.frame = CGRect(x: 40, y: 320, width: 350, height: 250)
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }
    

    
  

}
