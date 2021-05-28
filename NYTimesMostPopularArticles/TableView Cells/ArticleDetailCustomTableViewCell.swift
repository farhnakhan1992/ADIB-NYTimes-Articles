//
//  ArticleDetailCustomTableViewCell.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//

import UIKit

class ArticleDetailCustomTableViewCell: UITableViewCell {

    // MARK: - PROPERTIES
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPublishDate: UILabel!
    @IBOutlet weak var lblArticleSection: UILabel!
    @IBOutlet weak var lblPublishedBy: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // MARK: - CELL UI
    func setupCellUI(with object: PopularArticles){
        self.lblTitle?.text = object.title ?? ""
        self.lblDescription?.text = object.abstract ?? ""
        self.lblPublishedBy?.text = object.byline ?? ""
        self.lblArticleSection?.text = (object.section ?? "").capitalized
        self.lblPublishDate?.text = getFormatedDate(date: object.published_date ?? "", currentFormat: "yyyy-MM-dd", requiredFormat: "dd MMM, yyyy")
        if (object.media?.count ?? 0) != 0{
            if (object.media?[0].mediaMetaData?.count ?? 0) >= 3{
                let urlString = object.media?[0].mediaMetaData?[2].url ?? ""
                guard let url = URL.init(string: urlString) else {
                    imgCover.image = nil
                    return}
                imgCover.sd_setImage(with: url, completed: nil)
            }
        }
    }

}
