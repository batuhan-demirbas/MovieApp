//
//  DetailTableViewCell.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 20.03.2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
