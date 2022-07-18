//
//  CustomTabBarController.swift
//  PizzaWorld
//
//  Created by Ahmed Shawky on 17/07/2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    var coordenator: Coordenator
        
    init(coordenator: Coordenator) {
        self.coordenator = coordenator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum TabBarItems: Int, CaseIterable {
        case Home
        case PizzaMaker
        case Cart
    }
    
    lazy var middleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PizzaTabBar"), for: .normal)
        button.backgroundColor = .pinkishRed
        button.layer.cornerRadius = 30
        button.imageEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: 0)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "tabBar")
        setupTabBarItem()
        setupTabbarUI()
        createMiddleButton()
    }
    
    private func createMiddleButton() {
        self.tabBar.addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleButton.widthAnchor.constraint(equalToConstant: 60),
            middleButton.heightAnchor.constraint(equalToConstant: 60),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -16)
        ])
    }
    
    func setupTabbarUI(){
        tabBar.tintColor = .darkBlueGrey
        tabBar.unselectedItemTintColor = .pinkishRed
        tabBar.items?[TabBarItems.PizzaMaker.rawValue].isEnabled = false
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
    }
    
    private func setupTabBarItem(){
        self.viewControllers = TabBarItems.allCases.map({
            let view = viewControllerForTabBarItem($0)
            let navigation = UINavigationController(rootViewController: view)
            return navigation
            
        })
    }
    
    @objc func didPressMiddleButton() {
        print("pressed middle button")
        //add pizza controller
    }
    
    func viewControllerForTabBarItem(_ item: TabBarItems) -> UIViewController{
        switch item {
        case .Home:
            let view = coordenator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .PizzaMaker:
            let view = coordenator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .Cart:
            let view = coordenator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: item)
            return view
        }
    }
    private func tabBarItem(for item: TabBarItems) -> UITabBarItem?{
        let tabbaritem: UITabBarItem
        switch item {
        case .Home:
            tabbaritem = .init(title: "Home", image: UIImage(named: "Home") , selectedImage: UIImage(named: "Home"))
        case .PizzaMaker:
            return nil
        case .Cart:
            tabbaritem = .init(title: "Cart", image: UIImage(named: "Cart") , selectedImage: UIImage(named: "Cart"))
        }
        
        tabbaritem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
        tabbaritem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        
        return tabbaritem
    }
}



