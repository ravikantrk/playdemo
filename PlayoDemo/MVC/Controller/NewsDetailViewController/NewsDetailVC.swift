//
//  NewsDetailVC.swift
//  PlayoDemo
//
//  Created by Ravi kant Tiwari on 11/06/22.
//

import UIKit
import WebKit
import ProgressHUD

class NewsDetailVC: UIViewController,WKNavigationDelegate {
    
    @IBOutlet weak var newsWebView: WKWebView!
    var newsUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News Detail"
        loadWebView()
        
    }
    
    //MARK: load webview
    func loadWebView()
    {
        ProgressHUD.show()
        let myURL = URL(string:newsUrl)
        let myRequest = URLRequest(url: myURL!)
        newsWebView.load(myRequest)
        newsWebView.navigationDelegate = self
    }
    
    ///wk webview navigation delegate
    func webView(_ webView: WKWebView,didFinish navigation: WKNavigation!) {
        ProgressHUD.dismiss()
    }
    
    
}
