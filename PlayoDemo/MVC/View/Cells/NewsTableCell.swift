//
//  NewsTableCell.swift
//  PlayoDemo
//
//  Created by Ravi kant Tiwari on 11/06/22.
//

import UIKit
import SDWebImage

class NewsTableCell: UITableViewCell {
    
    //Objects
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsAutherNameLbl: UILabel!
    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsDescriptionLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    //MARK: configureCellData
    func configureNewsCellData(dataDict : NewsDataModel){
        self.newsAutherNameLbl.text = dataDict.author
        self.newsTitleLbl.text = dataDict.title
        self.newsDescriptionLbl.text = dataDict.descriptions
        let imgUrl = URL(string: dataDict.urlToImage)
        self.newsImageView.sd_setImage(with: imgUrl, placeholderImage: UIImage.init(systemName: "photo.fill"))
    }
}
