//
//  CakeListViewController.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 27/11/21.
//

import UIKit

class CakeListViewController: UIViewController {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var updateListButton: UIButton!
    
    private var viewModel: CakeListInterfaceToViewModelProtocol = CakeListViewModel(cakeListManager: CakeListManager(dataSource: CakeListDataSource()))
    
    private var cakeListModel: CakeListModel = CakeListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    
        viewModel.loadCakeList()
        
        viewModel.bindCakeListModel = { list in
            
            guard let list = list else { return }
            let uniqueItems = Array(Set(list.items))
            let uniqueItemsSorted = uniqueItems.sorted {$0.title < $1.title}
            
            self.cakeListModel.items = uniqueItemsSorted
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func configureUI() {
 
        self.contentView.backgroundColor = .clear
        
        updateListButton.setTitle("Update list", for: .normal)
        updateListButton.setTitleColor(.black, for: .normal)
        
        let itemWidth: CGFloat = view.frame.width * 0.40
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: itemWidth, height: 200.0)
        collectionViewLayout.minimumLineSpacing = 15
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
        collectionViewLayout.scrollDirection = .vertical
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(red: 246/257, green: 165/257, blue: 236/257, alpha: 1.0).withAlphaComponent(0.4)
        
        let cakeCollectionViewCellIdentifier = String(describing: CakeCollectionViewCell.self)
        let cakeCollectionViewCellNib = UINib(nibName: cakeCollectionViewCellIdentifier, bundle: nil)
        collectionView.register(cakeCollectionViewCellNib, forCellWithReuseIdentifier: cakeCollectionViewCellIdentifier)
    }

}

extension CakeListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CakeListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cakeItem = self.cakeListModel.items[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CakeCollectionViewCell.self), for: indexPath) as? CakeCollectionViewCell {
            
            cell.configureCell(model: cakeItem)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cakeListModel.items.count
    }
    
    
}
