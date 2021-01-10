//
//  ArticleViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.
//


import UIKit
import WebKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHC: NSLayoutConstraint!
    @IBOutlet weak var viewHC: NSLayoutConstraint!
    @IBOutlet weak var videoView: WKWebView!
    
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = article.name.rawValue
        nameLabel.text = article.name.rawValue
        imageView.image = UIImage(named: article.image.rawValue)
        imageView.contentMode = .scaleAspectFill
        
        //настройка характеристик текстВью
        textView.text = article.text.rawValue
        textView.isEditable = false
        
        //auto-size  textView
        textViewHC.constant = textView.contentSize.height
        viewHC.constant = textView.contentSize.height
        
         
        //настройка видео youTube
        getVideo(videoCode: article.video.rawValue)
        
    }
    
    //настройка видео youTube
    
    func getVideo(videoCode: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        videoView.load(URLRequest(url: url!))
    }
    

}

