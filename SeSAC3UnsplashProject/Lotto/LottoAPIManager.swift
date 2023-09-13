//
//  LottoAPIManager.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import Foundation


class LottoAPIManager {
        
        static let shared = LottoAPIManager()

        private init() { }
        
        func searchPhoto(query: Int, completion: @escaping (Lotto?) -> Void ) {
            let baseURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(query)"
        
            guard let url = URL(string: baseURL) else { return }
            
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error {
                    print(error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Lotto.self, from: data!)
                    completion(result)
                    
                } catch {
                    print(error)
                }
            }.resume()
            
        }
        
}
