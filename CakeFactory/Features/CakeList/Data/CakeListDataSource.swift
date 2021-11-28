//
//  ApiService.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 28/11/21.
//

import Foundation

class CakeListDataSource : NSObject, CakeListDataSourceProtocol {
    
    private let sourcesURL = URL(string: "https://gist.githubusercontent.com/juananthony/c51c635c877d53d0fbc7d803f23af7ea/raw/0d4454a75859e8f94834a3de257b0b69a77e0b10/cakes")!
    
    func getCakeListData(onSuccess: @escaping ([CakeItemDataOut]?) -> (), onError: @escaping (Error?) -> ()) {
        
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: self.sourcesURL) { (data, response, error) in
                if error != nil || data == nil {
                    onError(error)
                    
                } else {
                    if let data = data {

                        let jsonDecoder = JSONDecoder()

                        let cakeData = try? jsonDecoder.decode([CakeItemDataOut].self, from: data)
                        onSuccess(cakeData)
                    }
                }
            }.resume()
        }
    }
}

protocol CakeListDataSourceProtocol {
    func getCakeListData(onSuccess: @escaping ([CakeItemDataOut]?) -> (), onError: @escaping (Error?) -> ())
}
