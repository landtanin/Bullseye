//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Tanin on 10/02/2019.
//  Copyright © 2019 landtanin. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            
            let url = URL(fileURLWithPath: htmlPath)
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
            
        }
        
        
    }
    
    @IBAction func close(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

}
