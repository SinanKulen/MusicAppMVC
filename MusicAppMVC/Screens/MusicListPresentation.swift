//
//  MusicListPresentation.swift
//  MusicAppMVC
//
//  Created by Sinan Kulen on 1.03.2022.
//

import Foundation

struct MusicListPresentation
{
    var title : String
    
    init(title : String)
    {
        self.title = title
    }
    
    init(music : Music)
    {
        self.title = music.name
    }
}
