//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Nathan Stilwell on 10/1/15.
//  Copyright © 2015 Nathan Stilwell. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
  
  @IBOutlet weak var webView: UIWebView!

  override func viewDidLoad() {
    super.viewDidLoad()

    if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
      if let htmlData = NSData(contentsOfFile: htmlFile) {
        let baseUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
        webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
      }
    }
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  @IBAction func close () {
    dismissViewControllerAnimated(true, completion: nil)
  }
}
