//
//  ResourceWebViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 7/16/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import WebKit

class ResourceWebViewController: UIViewController,WKUIDelegate {
    
    var urlSet: String!
    var pageTitle = "Page"
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pageTitle
        print(urlSet!)
        setup()
        let myURL = URL(string:urlSet)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func setup(){
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            webView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }

}
