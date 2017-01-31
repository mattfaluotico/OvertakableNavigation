//
//  Overtakable.swift
//  NavigationPush
//
//  Created by Matthew Faluotico on 1/30/17.
//  Copyright © 2017 mattfaluotico. All rights reserved.
//

import UIKit

enum ReturnState {
    case initial
    case pushed
    case overtaken
}

protocol Overtakable: class {
    var navigationbar: UINavigationBar { get set }
    var returnedState: ReturnState { get set }
    
    func push(viewController: UIViewController)
    func overtake(viewController: UIViewController)
    func returning()
    func returned()
    func sync()
}

extension Overtakable where Self: UIViewController {
    func push(viewController: UIViewController) {
        self.returnedState = .pushed
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationbar.isHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func overtake(viewController: UIViewController) {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        self.returnedState = .overtaken
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationbar.isHidden = false
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func returning() {
        switch self.returnedState {
        case .initial:
            self.regularNavigationBar()
        case .pushed:
            self.regularNavigationBar()
        case .overtaken:
            self.customNavigationBar()
        }
    }
    
    func returned() {
        self.regularNavigationBar()
    }
    
    private func regularNavigationBar() {
        self.navigationbar.isHidden = true
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func customNavigationBar() {
        self.navigationbar.isHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func sync() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        guard let copy = navigationBar.makeCopy() else { return }
        self.navigationbar = copy
        
        if self.navigationbar.superview != self.view {
            self.view.addSubview(self.navigationbar)
        }
    }
}
extension UINavigationBar {
    func makeCopy() -> UINavigationBar? {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as? UINavigationBar
    }
}
