//
//  PostCell.swift
//  Note_Taker
//
//  Created by Jason Mai on 12/2/21.
//

import UIKit
import Parse
import AlamofireImage

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var hashTagLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
