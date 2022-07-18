//
//  MainNavigator.swift
//  PizzaWorld
//
//  Created by Ahmed Shawky on 18/07/2022.
//

import Foundation
import UIKit

class MainNavigator: Navigator {

    var coordenator: Coordenator
    
    enum Destination {
        case home
    }
    
    required init(coordenator: Coordenator) {
        self.coordenator = coordenator
    }
    
    func viewController(for Destination: Destination) -> UIViewController {
        switch Destination {
        case .home:
            let viewModel = HomeViewModel()
            let view = HomeViewController(viewmodel: viewModel, coordenator: coordenator)
            return view
        }
    }

}
