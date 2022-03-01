//
//  ViewController.swift
//  MusicAppMVC
//
//  Created by Sinan Kulen on 1.03.2022.
//

import UIKit

class MusicListViewController: UIViewController {

    @IBOutlet var musicListView: MusicListView!
    var service : ClientNetworkServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMusics()
    }

    func getMusics()
    {
        service.music {[weak self] response, error in
            guard let self = self else { return }
            guard let response = response else { return }
            let musics = response.feed.musics
            self.musicListView.showMusics(musics.map(MusicListPresentation.init))
        }
    }
}

