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
    var id = 0
    var name = ""
    convenience init(json : JSON){
        self.init()
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
    }
}
