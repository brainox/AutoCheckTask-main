//
//  Network+Service.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    private func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                print("An error occured: \(error)")
            }
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData, nil)
            } catch let error {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    func fetchAppsHeader(completion: @escaping (CarBrands?, Error?) -> Void) {
        fetchGenericJSONData(urlString: "https://api-prod.autochek.africa/v1/inventory/make?popular=true", completion: completion)
    }
    
    func fetchAllCars(completion: @escaping (AllCars?, Error?) -> Void) {
        fetchGenericJSONData(urlString: "https://api-prod.autochek.africa/v1/inventory/car/search", completion: completion)
    }
    
    func fetchCarDetails(id: String, completion: @escaping (CarDetails?, Error?) -> Void) {
        fetchGenericJSONData(urlString: "https://api-prod.autochek.africa/v1/inventory/car/\(id)", completion: completion)
    }
    
    func fetchCarMedia(id: String, completion: @escaping (CarMedia?, Error?) -> Void) {
        fetchGenericJSONData(urlString: "https://api-prod.autochek.africa/v1/inventory/car_media?carId=\(id)", completion: completion)
    }
    
}
