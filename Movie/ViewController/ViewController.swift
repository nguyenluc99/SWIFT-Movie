//
//  ViewController.swift
//  Movie
//
//  Created by Luc Nguyen on 8/1/19.
//  Copyright © 2019 Luc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = "https://api.themoviedb.org/3/genre/movie/list?api_key=d3b02775c9da342c4228c0d098fae6b2"
        
//        APIGenres.shared.getData(url: url) { (success, data) in
//
//        }
        let urlDiscover = "https://api.themoviedb.org/3/discover/movie?api_key=d3b02775c9da342c4228c0d098fae6b2"
        APIGenres.shared.getDiscover(url: urlDiscover) { (success, [String : Any?]?) in
            
            
        }
    }


}

