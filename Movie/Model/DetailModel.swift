//
//  DetailModel.swift
//  Movie
//
//  Created by Luc Nguyen on 8/1/19.
//  Copyright © 2019 Luc Nguyen. All rights reserved.
//

import Foundation
import SwiftyJSON

class DetailModel : NSObject{
    var poster = ""
    var title = ""
    var year = ""
    var genre = [String]()
    
    convenience init(json : JSON) {
        self.init()
        self.poster = json["poster_path"].stringValue
        self.title = json["title"].stringValue
        self.year = json["release_date"].stringValue
        let genre = json["genre_ids"].arrayObject as! [Int]
        for gen in genre {
            self.genre.append(AppSettings.genres[gen]!)
        }
        
    }
}
