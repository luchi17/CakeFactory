//
//  CakeDetailViewController.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 28/11/21.
//

import UIKit

class CakeDetailViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    var model: CakeItemModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "GillSans-Bold", size: 16)
        
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont(name: "GillSans-Bold", size: 14)
        
        imageView.contentMode = .scaleAspectFit
        
        setModel()
    }
    
    func setModel() {
        titleLabel.text = model?.title
        subtitleLabel.text = model?.description
        if let imageUrlString = model?.imageUrlString {
            imageView.image = Utils.getImage(from: imageUrlString)
        }
        
    }
}
