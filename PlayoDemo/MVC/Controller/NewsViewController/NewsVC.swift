//
//  ViewController.swift
//  PlayoDemo
//
//  Created by Ravi kant Tiwari on 11/06/22.
//

import UIKit
import Alamofire
import ProgressHUD

class NewsVC: UIViewController {
    //MARK: varibles and outlets
    @IBOutlet weak var newsTableView: UITableView!
    
    let apiKey = "491e568dbb87407c9b092f2e79069801"
    var articlesDataArr = [NewsDataModel]()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNewsList()
        addPullToRefresh()
    }
    //MARK: pull to refresh
    func addPullToRefresh()
    {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        newsTableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        getNewsList()
        refreshControl.endRefreshing()
    }
}
extension NewsVC
{
    //MARK: News Api
    func getNewsList()
    {
        ProgressHUD.show()
        NetworkManger().getApiCall(apiurl: apiKey) { response in
            switch response {
            case .success(let responseDict):
                ProgressHUD.dismiss()
                if responseDict["articles"] != nil {
                    self.articlesDataArr = NewsDataModel.giveList(list: responseDict["articles"] as? [[String:Any]] ?? [[:]])
                    self.newsTableView.reloadData()
                    self.newsTableView.delegate = self
                    self.newsTableView.dataSource = self
                }
            case .failed(let error):
                ProgressHUD.dismiss()
                print("Request error: \(error)")
            }
        }

    }
    
}
//MARK: Tableview delegate and datasource
extension NewsVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell") as! NewsTableCell
        cell.configureNewsCellData(dataDict: self.articlesDataArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.newsTableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsDetailVC") as! NewsDetailVC
        vc.newsUrl = self.articlesDataArr[indexPath.row].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
