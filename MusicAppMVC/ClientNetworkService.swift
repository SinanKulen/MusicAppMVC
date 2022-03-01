//
//  ClientNetworkService.swift
//  MusicAppMVC
//
//  Created by Sinan Kulen on 1.03.2022.
//

import Foundation

protocol ClientNetworkServiceProtocol
{
    func music(completion: @escaping (MusicDTO?,NetworkError?)->Void)
}

class ClientNetworkService : ClientNetworkServiceProtocol
{
    private enum Endpoints : String
    {
        case music = "music/most-played/50/albums"
        
    }
    
    private let networkService : NetworkServiceProtocol = NetworkService()
    
    func music(completion: @escaping (MusicDTO?,NetworkError?)->Void)
    {
        let urlString = Endpoints.music.rawValue
        networkService.get(from: urlString, completion: completion)
    }
}

