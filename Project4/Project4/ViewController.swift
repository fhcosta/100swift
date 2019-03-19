//
//  ViewController.swift
//  Project4
//
//  Created by Flavio Costa on 20/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit
import WebKit

//Makes that class conforms with WKNavigationDelegate
class ViewController: UIViewController, WKNavigationDelegate {
    
    //Create the webView property
    var webView: WKWebView!
    
    //Override the loadView Method (View that the controller managed)
    override func loadView() {
        
        webView = WKWebView()
        
        //Set the webView Delegate
        webView.navigationDelegate = self
        
        //Say to the main view that now it must be the webView
        view = webView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load the URL
        let url = URL(string: "https://www.hackingwithswift.com")!
        
        //Load the content of the URL using a URLRequest
        webView.load(URLRequest(url: url))
        
        //Set as true back and forward gestures in the webView
        webView.allowsBackForwardNavigationGestures = true
     
        //Right Navigation Bar Button to call the method openTapped when the user taps the button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open Page", style: .plain, target: self, action: #selector(openTapped))
        
        
        
    }
    
    //Method that creates the UIAlertController and three action.
    @objc func openTapped(){
        
        //Create the alert
        let alert = UIAlertController.init(title: "Open page ...", message: nil, preferredStyle: .actionSheet)
        
        //Add two actions with a handler method openPage
        alert.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        alert.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        
        //Just cancel the UIAlertController
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true, completion: nil)
    
    }

    //Method called when the user taps one of two alert action with handler
    func openPage(action: UIAlertAction){
        
        //Check if there is an action title
        guard let actionTitle = action.title else {return}
        
        //Check if is possible to create a url
        guard let url = URL(string: "https://" + actionTitle) else {return}
        
        //Load the url using the URLRequest
        webView.load(URLRequest(url: url))
        
    }
    
    //MARK: - Web View Delegate
    
    //When webView did finish to load, change the title
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}

