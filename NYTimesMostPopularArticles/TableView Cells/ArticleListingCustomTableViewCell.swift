//
//  ArticleListingCustomTableViewCell.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//

import UIKit

class ArticleListingCustomTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
