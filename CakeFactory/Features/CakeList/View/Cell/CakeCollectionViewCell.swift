//
//  CakeCollectionViewCell.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 26/11/21.
//

import UIKit

class CakeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       configureUI()
    }
    
    func configureUI() {
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12.0
        
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.font = UIFont(name: "GillSans-Bold", size: 13)
    }
    
    func configureCell(model: CakeItemModel) {
        
        titleLabel.text = model.title
        if let image = model.image {
            imageView.image = UIImage(data: image)
        }
    }

}
