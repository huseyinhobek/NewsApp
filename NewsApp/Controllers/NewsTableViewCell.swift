//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Hüseyin HÖBEK on 10.11.2022.
//
// ben cellden Article (modele) nasıl ulaşabiliyorum.

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var newTitle: UILabel!
    @IBOutlet var newSource: UILabel!
    @IBOutlet var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func model(model: Article?) {
        guard let article = model else {return}
        newTitle.text = article.title
        newSource.text = article.author
       // newsImageView.image = UIImage("LOGO")
        
        let url = URL(string: article.urlToImage ?? "")
        newsImageView.kf.setImage(with: url)
        
        //newSource.text = model.articleDescription
        //  newsImageView.image = UIImage!
    }
    

}
