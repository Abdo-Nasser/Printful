//
//  HomeViewController.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit

class HomeViewController: UIViewController {
    //Attributes
    var presenter: HomePresenterProtocol?

    //OutLets
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.attach()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupCollectionViewLayout()
    }
    
    func setupUI(){
        registerCell()
        setupDelegates()
    }
}

//MARK: - HomeViewControllerProtocol
extension HomeViewController: HomeViewControllerProtocol {
    
    func showLoading(_ show: Bool){
        if show {
            showIndicatorAnimation()
        }else{
            hideIndicatorAnimation()
        }
    }
    
    func UpdateUI(){
        collectionView.reloadData()
    }
}

//MARK: - CollectionView Delegate & DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func registerCell(){
        let homeNib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        collectionView.register(homeNib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    func setupDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    private func setupCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        layout.collectionView?.allowsSelection = false
        layout.itemSize = CGSize(width: (collectionView.frame.width-15)/2,
                                 height: (collectionView.frame.height-30)/2)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.viewModel.listOfProducts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let product = presenter?.viewModel.listOfProducts[indexPath.row] ?? Product()
        cell.configure(product: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = presenter?.viewModel.listOfProducts[indexPath.row] ?? Product()
        presenter?.openProduct(product)
    }
}
