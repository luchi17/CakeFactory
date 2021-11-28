//
//  Utils.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 28/11/21.
//

import UIKit

class Utils {
    
    static func getImage(from string: String) -> UIImage? {
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
