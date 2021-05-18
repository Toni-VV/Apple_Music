//
//  NetworkService.swift
//  Apple_Music
//
//  Created by Антон on 13.02.2021.
//

import UIKit
import Alamofire

class NetworkService{
    
    func fetchTracks(searchText: String, completion: @escaping (Music?) -> Void){
        let url = "https://itunes.apple.com/search"
        let parameters = ["term":"\(searchText)","limit":"100", "media": "music"]
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error{
                print("Error: \(error)")
                completion(nil)
                return
            }
            if let data = dataResponse.data{
                let decoder = JSONDecoder()
                do{
                    let objects = try decoder.decode(Music.self, from: data)
                    completion(objects)
                }
                catch let jsonError{
                    print("Error: \(jsonError)")
                    completion(nil)
                }
            }
        }
    }
    
   
}
