//
//  ViewController.swift
//  NewsApp
//
//  Created by Hüseyin HÖBEK on 10.11.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    var viewModel: MainViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    var chosenNews : Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        viewModel = MainViewModel(webService: MainWebServiceAdapter(webService: NewsWebService()))
        guard let viewModel = viewModel else {return}
        viewModel.getNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    /*
    func secondary() {
        let vc = MainViewController()
        // vc.viewModel = MainViewModel(webService: <#T##MainWebServiceAdapter#>)/////
        self.navigationController?.pushViewController(vc, animated: true)
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.articleList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsTableViewCell)!
        let article = viewModel?.articleList[indexPath.row] 
        cell.model(model: article)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenNews = viewModel?.articleList[indexPath.row]
       // let chosen: Article? = viewModel?.articleList[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailVC
            destinationVC.selectedNews = chosenNews
        }
    }
    
}



