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
    @IBOutlet private weak var errorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       configureUI()
    }
    
    func configureUI() {
        
        errorLabel.isHidden = true
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12.0
        
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.font = UIFont(name: "GillSans-Bold", size: 13)
        titleLabel.textAlignment = .center
        
        errorLabel.font = UIFont(name: "GillSans-Bold", size: 14)
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        errorLabel.textColor = .red
    }
    
    func configureCell(model: CakeItemModel) {
        
        titleLabel.text = model.title
        
        let image = Utils.getImage(from: model.imageUrlString)
        imageView.image = image
        
        if image != nil {
            imageView.image = image
            errorLabel.isHidden = true
        } else {
            errorLabel.text = "Image could not be loaded"
            errorLabel.isHidden = false
        }
        
    }
}
