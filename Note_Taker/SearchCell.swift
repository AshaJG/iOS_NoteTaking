//
//  SearchCell.swift
//  Note_Taker
//
//  Created by Jason Mai on 12/7/21.
//

import UIKit

class SearchCell: UITableViewCell {

    
    @IBOutlet weak var searchCourse: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchName: UILabel!
    @IBOutlet weak var searchTag: UILabel!
    @IBOutlet weak var searchDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
