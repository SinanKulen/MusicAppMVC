//
//  MusicListView.swift
//  MusicAppMVC
//
//  Created by Sinan Kulen on 1.03.2022.
//

import UIKit

class MusicListView: UIView {
    @IBOutlet var tableView: UITableView!
    
    private var musics : [MusicListPresentation] = []
    
    func showMusics(_ musics: [MusicListPresentation])
    {
        self.musics = musics
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
        }
    }
}

extension MusicListView : UITableViewDelegate
{
    
}

extension MusicListView : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = musics[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
