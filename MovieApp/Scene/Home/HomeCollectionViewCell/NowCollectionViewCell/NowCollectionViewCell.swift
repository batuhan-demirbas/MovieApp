//
//  NowCollectionViewCell.swift
//  MovieApp
//
//  Created by Batuhan on 14.03.2023.
//

import UIKit

class NowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var movie: MovieResult?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name.text = movie?.title
    }

}
