//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Wilfred Asomani on 06/04/2020.
//  Copyright © 2020 Wilfred Asomani. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView?.load(request)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
