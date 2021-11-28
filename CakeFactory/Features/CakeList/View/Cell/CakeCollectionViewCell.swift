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
        titleLabel.textAlignment = .center
    }
    
    func configureCell(model: CakeItemModel) {
        
        titleLabel.text = model.title
        imageView.image = getImage(from: model.imageUrlString)
    }
    
    func getImage(from string: String) -> UIImage? {
        guard let url = URL(string: string) else {
             return nil
        }

        var image: UIImage?
        do {
            let data = try Data(contentsOf: url, options: [])
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        return image
    }

}
