//
//  PandemicViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 7/2/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import WebKit

class PandemicViewController: UIViewController, WKUIDelegate {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pandemic Info"
        setup()
        let myURL = URL(string:"https://sf.gov/topics/coronavirus-covid-19")
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
