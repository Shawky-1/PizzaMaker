//
//  AppCoordinator.swift
//  PizzaWorld
//
//  Created by Ahmed Shawky on 17/07/2022.
//

import Foundation
import UIKit

protocol Coordenator {
    var Main: MainNavigator { get }
    var navigationController: UINavigationController? { get }
}

class AppCoordinator: Coordenator{
    let window: UIWindow
    private lazy var tabBar: CustomTabBarController = {
        return CustomTabBarController(coordenator: self)
    }()
    
    lazy var Main: MainNavigator = {
        return .init(coordenator: self)
    }()
    
    var navigationController: UINavigationController? {
        if let navigationController = tabBar.selectedViewController as? UINavigationController {
            return navigationController
        }
        return nil
    }
    
    init(window: UIWindow = UIWindow()){
        self.window = window
        Main = .init(coordenator: self)
    }
    
    func start(){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController: UIViewController {
        return tabBar
    }
    
}
