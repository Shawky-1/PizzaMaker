//
//  HomeViewModel.swift
//  PizzaWorld
//
//  Created by Ahmed Shawky on 10/07/2022.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    private var sliderTimer:Timer?
    var slides: BehaviorRelay<[Int]> = .init(value: [1, 2, 3])
    var popularItems: BehaviorRelay<[Product]> = .init(value: [
        .init(title: "test"),
        .init(title: "test"),
        .init(title: "test"),
        .init(title: "test")
    ])

    private var currentSlide = 0
    
    // Outputs
    var slideToItem: PublishSubject<Int> = .init()
    
    // Inputs
    func viewDidLoad(){
        sliderTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    @objc func scrollToNextItem() {
        let nextSlide = currentSlide + 1
        currentSlide = nextSlide % slides.value.count
        slideToItem.onNext(currentSlide)
    }
    
    func didSelectItem(){
        slides.accept([1, 2, 3])
    }
    
    //MARK: Public variables
    var numberOfItems: Int {
        return slides.value.count
    }
    
}
