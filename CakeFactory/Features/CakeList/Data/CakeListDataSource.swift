//
//  ApiService.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 28/11/21.
//

import Foundation

class CakeListDataSource : NSObject, CakeListDataSourceProtocol {
    
    private let sourcesURL = URL(string: "https://gist.githubusercontent.com/juananthony/c51c635c877d53d0fbc7d803f23af7ea/raw/0d4454a75859e8f94834a3de257b0b69a77e0b10/cakes")!
    
    func getCakeListData(completion: @escaping ([CakeItemDataOut]) -> ()) {
        
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: self.sourcesURL) { (data, response, error) in
                if let data = data {
                    
                    let jsonDecoder = JSONDecoder()
                    
                    let cakeData = try! jsonDecoder.decode([CakeItemDataOut].self, from: data)
                    completion(cakeData)
                }
            }.resume()
        }
    }
}

protocol CakeListDataSourceProtocol {
    func getCakeListData(completion: @escaping ([CakeItemDataOut]) -> ())
}
