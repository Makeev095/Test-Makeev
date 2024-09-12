//
//  NetworkService.swift
//  Test
//
//  Created by Макей 😈 on 12.09.2024.
//

//
//  NetworkService.swift
//  Test
//
//  Created by Макей 😈 on 12.09.2024.
//

import Foundation

class NetworkService {
    
    // URL для запроса
    private let urlString = "https://cars.cprogroup.ru/api/episode/statistics/"
    
    // Метод для получения количества посетителей
    func fetchVisitors(completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let visitorsResponse = try JSONDecoder().decode(VisitorsResponse.self, from: data)
                let visitorsCount = visitorsResponse.statistics.count
                completion(.success(visitorsCount))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
