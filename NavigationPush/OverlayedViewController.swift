//
//  OverlayedViewController.swift
//  NavigationPush
//
//  Created by Matthew Faluotico on 1/30/17.
//  Copyright © 2017 mattfaluotico. All rights reserved.
//

import UIKit

class OverlayedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.style()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func style() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 64) )
        navbar.tintColor = .white
        navbar.barTintColor = .blue
        navbar.backgroundColor = .blue
        navbar.isTranslucent = false
        navbar.items = {
            let item = UINavigationItem(title: "blue")
            item.leftBarButtonItem = UIBarButtonItem(title: "<- back", style: .done, target: nil, action: nil)
            return [item]
        }()
        
        self.view.addSubview(navbar)
    }
}
