//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let size: CGFloat = 100
    lazy var animatedView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        view.backgroundColor = .blue
        view.layer.cornerRadius = 8
        return view
    }()
    
    var snap: UISnapBehavior!
    var animator: UIDynamicAnimator!

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(animatedView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        
        view.addGestureRecognizer(tapGesture)
        
        snap = UISnapBehavior(item: animatedView, snapTo: view.center)
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(snap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        snap.snapPoint = view.center
    }
    
    @objc func tapAction(_ sender: UITapGestureRecognizer) {
        let pos = sender.location(ofTouch: 0, in: view)
        
        snap.snapPoint = pos
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
