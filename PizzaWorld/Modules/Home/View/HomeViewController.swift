//
//  HomeViewController.swift
//  PizzaWorld
//
//  Created by Ahmed Shawky on 23/02/2022.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: BaseWireFrame<HomeViewModel>{

    @IBOutlet weak var sliderCollectionView:UICollectionView!
    @IBOutlet weak var popularTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        viewModel.viewDidLoad()
        setupPopularTableView()
    }
    
    override func bind(viewModel: HomeViewModel) {
        viewModel.slideToItem.subscribe { [weak self] (index) in
            self?.sliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }.disposed(by: disposeBag)
        viewModel.slides.subscribe { [weak self] (_) in
            self?.sliderCollectionView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    func setupPopularTableView() {
        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)

        viewModel.popularItems.asObservable()
            .bind(to: popularTableView.rx.items(cellIdentifier: String(describing: PopularCell.self), cellType: PopularCell.self)) { index, model, cell in
//                cell.ratingView.configureWithRating(rating: 5, Style: .compact)
                cell.ratingView.configureWithRating(rating: 3, Style: .compact)
        }.disposed(by: disposeBag)

        popularTableView.rx.itemSelected.subscribe { [weak self] (indexPath) in
//            guard let self = self, let indexPath = indexPath.element else { return }
        }.disposed(by: disposeBag)
    }

    
    private func setupUI() {
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
    }
    
    private func registerCells() {
        sliderCollectionView.registerCell(cellClass: SliderCell.self)
        popularTableView.registerCellNib(cellClass: PopularCell.self)
    }

}

//MARK: Slider Datasource
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordenator.Main.navigate(to: .home)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
