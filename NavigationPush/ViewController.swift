//
//  ViewController.swift
//  NavigationPush
//
//  Created by Matthew Faluotico on 1/30/17.
//  Copyright © 2017 mattfaluotico. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Overtakable {
    
    var returnedState: ReturnState = .initial
    var navigationbar: UINavigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            button.backgroundColor = .red
            button.setTitle("Push", for: .normal)
            button.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)
            self.view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
            button.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        }()
        
        let button2 = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            button.backgroundColor = .blue
            button.setTitle("Overlay", for: .normal)
            self.view.addSubview(button)
            button.addTarget(self, action: #selector(overtakeViewController), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        }()
        
        if let navigationbar = self.navigationController?.navigationBar {
            
        }
        
        if let navbar = self.navigationController?.navigationBar {
            navbar.backgroundColor = .white
            navbar.tintColor = .red
            navbar.barTintColor = .white
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "hi", style: .plain, target: nil, action: nil)
        self.title = "banana"
        
        self.sync()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.returning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.returned()
    }
    
    func pushViewController() {
        self.push(viewController: PushedViewController() )
    }
    
    func overtakeViewController() {
        self.overtake(viewController: OverlayedViewController() )
    }
}

