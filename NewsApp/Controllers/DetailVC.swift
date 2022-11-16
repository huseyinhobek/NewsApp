//
//  DetailVC.swift
//  NewsApp
//
//  Created by Hüseyin HÖBEK on 16.11.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    var selectedNews: Article?
    @IBOutlet weak var sourceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedNews?.title
        descriptionLabel.text = selectedNews?.publishedAt as? String
        testLabel.text = selectedNews?.content
        sourceLabel.text = selectedNews?.author
        let url = URL(string: selectedNews?.urlToImage ?? "")
        imageView.kf.setImage(with: url)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
