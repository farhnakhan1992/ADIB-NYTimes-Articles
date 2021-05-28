//
//  ArticleListingCustomTableViewCell.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//

import UIKit
import SDWebImage
class ArticleListingCustomTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgThumbnail.layer.cornerRadius = 8.0
        imgThumbnail.clipsToBounds = true
        // Initialization code
    }

    // MARK: - CELL UI POPULATE DATA
    func setupCell(with object: PopularArticles){
        self.lblTitle?.text = object.title ?? ""
        self.lblSubtitle?.text = object.abstract ?? ""
        self.lblAuthor?.text = object.byline ?? ""
        self.lblPublishedDate?.text = getFormatedDate(date: object.published_date ?? "", currentFormat: "yyyy-MM-dd", requiredFormat: "dd MMM, yyyy")
        if object.media?.count != 0{
            if object.media?[0].mediaMetaData?.count != 0{
                let urlString = object.media?[0].mediaMetaData?[0].url ?? ""
                guard let url = URL.init(string: urlString) else {
                    imgThumbnail.image = nil
                    return}
                imgThumbnail.sd_setImage(with: url, completed: nil)
            }
        }
        
    }

}
