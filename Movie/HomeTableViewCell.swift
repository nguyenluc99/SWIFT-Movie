//
//  HomeTableViewCell.swift
//  Movie
//
//  Created by Luc Nguyen on 8/5/19.
//  Copyright © 2019 Luc Nguyen. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        APIGenres.shared.getDiscover(url: <#T##String#>, completion: <#T##Completion##Completion##(Bool, [String : Any?]?) -> ()#>)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
