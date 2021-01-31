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
    @IBOutlet weak var viewItems: UIView!
    
    //аутлеты блока Совет
    @IBOutlet weak var textViewAdvice: UITextView!
    @IBOutlet weak var textViewAdviceHC: NSLayoutConstraint!
    @IBOutlet weak var viewAdviceHC: NSLayoutConstraint!
   
    
    
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        title = article.name.rawValue
        nameLabel.text = article.name.rawValue
//        imageView.image = UIImage(named: article.image.rawValue)
//        imageView.contentMode = .scaleAspectFill
        
        //настройка характеристик текстВью
        textView.text = article.text.rawValue
        textView.isEditable = false
        
        //auto-size  textView
        textViewHC.constant = textView.contentSize.height
        viewHC.constant = textView.contentSize.height
        
        //настройка блока Совет + autosize
        textViewAdvice.text = article.textAdvice.rawValue
        textViewAdvice.isEditable = false
        textViewAdviceHC.constant = textViewAdvice.contentSize.height
        viewAdviceHC.constant = textViewAdvice.contentSize.height + 100

        
         
        //настройка видео youTube
        getVideo(videoCode: article.video.rawValue)
        
        //настройка вью items
        viewItems.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
//        viewItems.alpha = 0.75
//        viewItems.layer.shadowColor = UIColor.black.cgColor
//        viewItems.layer.shadowOpacity = 1
////        viewItems.layer.shadowOffset = CGSize.zero
//        viewItems.layer.shadowRadius = 5
        
        
    }
    
    //настройка видео youTube
    
    func getVideo(videoCode: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        videoView.load(URLRequest(url: url!))
    }
    
    
    
}

