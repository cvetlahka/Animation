//
//  ViewController.swift
//  Animation
//
//  Created by Светлана Сафонова on 14.11.2020.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    
    @IBOutlet var springAnimationVeiw: SpringView!
    private var originCoordinate: CGFloat?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        originCoordinate = coreAnimationView.frame.origin.x
    }

    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.autoreverse, .repeat ]) {
            if self.coreAnimationView.frame.origin.x == self.originCoordinate{
                self.coreAnimationView.frame.origin.x -= 40
            }
        }
    }
    
    @IBAction func rubSpringAnimationButton(_ sender: SpringButton) {
        springAnimationVeiw.animation = "fadeIn"
        springAnimationVeiw.curve = "easeIn"
        springAnimationVeiw.duration = 1
        springAnimationVeiw.animate()
        
        sender.animation = "shake"
        sender.animate()
    }
}

