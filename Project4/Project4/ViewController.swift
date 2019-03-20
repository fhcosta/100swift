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
    //Create a ProgressView to show the progress of page loading
    var progressView: UIProgressView!
    
    //Create a websites array
    let webSites = ["apple.com","hackingwithswift.com"]
    
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
        let url = URL(string: "https://" + webSites[0])!
        
        //Load the content of the URL using a URLRequest
        webView.load(URLRequest(url: url))
        
        //Set as true back and forward gestures in the webView
        webView.allowsBackForwardNavigationGestures = true
     
        //Right Navigation Bar Button to call the method openTapped when the user taps the button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        
        //Create two bar buttom items to add in the toolbar
        
        //Spacer
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        //Refresh
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        //Set toolbar hidden state to false
        navigationController?.isToolbarHidden = false
        
        //Add the style bar to the progress view
        progressView = UIProgressView(progressViewStyle: .bar)
    
        //Adjust the progressView in the view
        progressView.sizeToFit()
        
        //Add the progressView as a BarButtonItem
        let progressButton = UIBarButtonItem(customView: progressView)
        
        //Add the Bar Button Items to the toolbarItems array
        toolbarItems = [progressButton, spacer,refresh]
        
        //To observe how long is the loading of a WEbView, let's use the KVO (Key Value Observing) tool
        
        //Add a observer to the webview.
        //Keypath is the value to observe
        //the option new is to get new values for the keypath
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        
        
    }
    
    //Method that creates the UIAlertController and three action.
    @objc func openTapped(){
        
        //Create the alert
        let alert = UIAlertController.init(title: "Open page ...", message: nil, preferredStyle: .actionSheet)
        
        //Add actions with a handler method openPage
        //Read the website arrays to get the websites
        for webSite in webSites{
            alert.addAction(UIAlertAction(title: webSite, style: .default, handler: openPage))
        }
      
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

    
    //Method called when a KVO observed value has changed
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    
    //Call decidePolicy decisionHandler to check if the url is being showed. If is the current url hosted, return. If  not, allow to open the url
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.url
        
        if let host = url?.host{
            for webSite in webSites{
                if host.contains(webSite){
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        decisionHandler(.cancel)
        
    }
    
}

