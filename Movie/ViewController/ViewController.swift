//
//  ViewController.swift
//  Movie
//
//  Created by Luc Nguyen on 8/1/19.
//  Copyright © 2019 Luc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var genreArray = [DetailModel]()
    let cellID = "cellID"
    @IBOutlet weak var tbvGenre: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tbvGenre.delegate = self
        self.tbvGenre.dataSource = self
        self.tbvGenre.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        let url = "https://api.themoviedb.org/3/genre/movie/list?api_key=d3b02775c9da342c4228c0d098fae6b2"
        
        APIGenres.shared.getData(url: url) { (success, data) in
            if (!success) {
                return
            }
        }
        let urlDiscover = "https://api.themoviedb.org/3/discover/movie?api_key=d3b02775c9da342c4228c0d098fae6b2"
        APIGenres.shared.getDiscover(url: urlDiscover) { (success, data) in
            if (success) {
                self.genreArray = data!["detailModel"] as! [DetailModel]
                DispatchQueue.main.async{
                    self.tbvGenre.reloadData()
                }
            } else {
                return
            }
        }
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? HomeTableViewCell else {
            return HomeTableViewCell()
        }
        cell.lblYear.text = genreArray[indexPath.row].year
        cell.lblTitle.text = genreArray[indexPath.row].title
        let tmpStr = genreArray[indexPath.row].genre.joined(separator: ", ")
        cell.lblGenre.text = tmpStr
        return cell
    }
}

