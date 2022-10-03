//
//  SecondViewController.swift
//  HomeWork11
//
//  Created by Darya Grabowskaya on 3.10.22.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Public properties
    var circle = UIView()
   
    // MARK: - Override properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCircle()
        view.addSubview(circle)
        
        guard let vsc = navigationController?.viewControllers else { return }
        
        guard let vc = vsc.first(where: { vc in (vc as? StartGameViewController) != nil}) as? StartGameViewController else { return }
    }
    
    // MARK: - Public methods
    @objc
    func moveCircle(_ gestureRecognizer: UISwipeGestureRecognizer) {
        
        switch gestureRecognizer.direction {
        case .right:
            circle.frame.origin.x += 25
        case .left:
            circle.frame.origin.x -= 25
        case .up:
            circle.frame.origin.y -= 25
        case .down:
            circle.frame.origin.y += 25
            
        default:
            return
        }
     
    }
    
    // MARK: - Private methods
    private func myCircle() {
        
        circle = UIView(frame: CGRect(x: 165, y: 350, width: 60, height: 60))
        circle.backgroundColor = UIColor.blue
        circle.layer.cornerRadius = 30
        
        addSwipe(to: circle, direction: .right)
        addSwipe(to: circle, direction: .left)
        addSwipe(to: circle, direction: .up)
        addSwipe(to: circle, direction: .down)
        
    }
    
    private func addSwipe(to view: UIView, direction: UISwipeGestureRecognizer.Direction) {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircle))
        swipeGesture.direction = direction
        view.addGestureRecognizer(swipeGesture)
    }
    
   
}
