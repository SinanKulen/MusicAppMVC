//
//  MusicListView.swift
//  MusicAppMVC
//
//  Created by Sinan Kulen on 1.03.2022.
//

import UIKit

class MusicListView: UIView {
    @IBOutlet var tableView: UITableView!
}

extension MusicListView : UITableViewDelegate
{
    
}

extension MusicListView : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
