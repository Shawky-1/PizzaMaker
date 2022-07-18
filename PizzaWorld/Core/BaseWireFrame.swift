//
//  BaseWireFrame.swift
//  PizzaWorld
//
//  Created by Ahmed Shawky on 18/07/2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class BaseWireFrame<T>: UIViewController{
    let viewModel: T
    var coordenator: Coordenator

    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(viewModel: viewModel)
    }
    
    init(viewmodel: T, coordenator: Coordenator) {
        self.viewModel = viewmodel
        self.coordenator = coordenator
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(viewModel: T){
        fatalError("Please override bind function")
    }
}
