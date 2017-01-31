//
//  ViewController.swift
//  NavigationPush
//
//  Created by Matthew Faluotico on 1/30/17.
//  Copyright © 2017 mattfaluotico. All rights reserved.
//

import UIKit

class ViewController_og: UIViewController {
    
    enum Destination {
        case overlay
        case push
        case initial
    }
    
    var navbar: UINavigationBar!
    var destination: Destination = .initial
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button1 = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            button.backgroundColor = .red
            button.setTitle("Push", for: .normal)
            button.addTarget(self, action: #selector(push), for: .touchUpInside)
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
            button.addTarget(self, action: #selector(overlay), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        }()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: nil, action: nil)
        self.title = "title"
        self.coreNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.destination == .push {
            
        } else {
            self.topNavigationController()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func topNavigationController() {
        self.navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 64) )
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        
        self.navbar.items = [self.item()]
        
        self.view.addSubview(self.navbar)
        
        self.navbar.tintColor = .red
        self.navbar.backgroundColor = .white
        
    }
    
    func item() -> UINavigationItem {
        let item = UINavigationItem(title: "title")
        item.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: nil, action: nil)
        return item
    }
    
    func coreNavigationController() {
        if let navbar = self.navigationController?.navigationBar {
            navbar.tintColor = .red
            navbar.backgroundColor = .white
        }
    }
    
    func push() {
        self.destination = .push
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.pushViewController( PushedViewController(), animated: true)
    }
    
    func overlay() {
        self.destination = .overlay
        self.navigationController?.pushViewController( OverlayedViewController(), animated: true)
    }
    
}

