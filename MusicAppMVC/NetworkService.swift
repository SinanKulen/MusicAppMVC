//
//  NetworkService.swift
//  MusicAppMVC
//
//  Created by Sinan Kulen on 1.03.2022.
//

import Foundation

protocol NetworkServiceProtocol
{
    func get<T:Decodable>(from endpoints : String, completion: @escaping (T?, NetworkError?)->Void)
}

enum NetworkError : Error
{
    case invalidURL
    case custom(String)
    case noData
}

class NetworkService : NetworkServiceProtocol
{
    private let baseURL = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/"
    
    func get<T:Decodable>(from endpoints : String, completion: @escaping (T?, NetworkError?)->Void)
    {
        guard let url = URL(string: baseURL + endpoints + ".json")
        else
        {
            completion(nil,NetworkError.invalidURL)
            return
        }
        createTask(from: url, completion: completion).resume()
    }
    
    func createTask<T:Decodable>(from url: URL, completion: @escaping (T?, NetworkError?)->Void) -> URLSessionDataTask
    {
        return URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil
            else
            {
                completion(nil,NetworkError.custom(error!.localizedDescription))
                return
            }
            
            guard let data = data else {
                completion(nil,NetworkError.noData)
                return
            }
            do
            {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData,nil)
            }
            catch
            {
                completion(nil,NetworkError.custom(error.localizedDescription))
                return
            }
        }
    }
}
