//
//  MessengerTableViewCell.swift
//  chatapp
//
//  Created by HungPN on 14/11/2022.
//

import UIKit

class MessengerTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var contentLb: UILabel!
    @IBOutlet weak var timeLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ imageUrl: String,_ name: String, _ content: String, _ time: String){
        timeLb.text = time
        nameLb.text = name
        contentLb.text = content
        
        avatarImage.load(urlString: imageUrl)
        
    }
    
}
