//
//  Navigator.swift
//  PizzaWorld
//
//  Created by Ahmed Shawky on 18/07/2022.
//

import Foundation
import UIKit

protocol Navigator {
    associatedtype Destination
    var coordenator: Coordenator { get }
    func viewController(for Destination: Destination) -> UIViewController
    init(coordenator: Coordenator)
    func navigate(to destination: Destination)
}

extension Navigator {
    func navigate(to destination: Destination){
        let viewcontroller = self.viewController(for: destination)
        coordenator.navigationController?.pushViewController(viewcontroller, animated: true)
        
    }
}
