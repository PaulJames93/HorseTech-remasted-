//
//  ContentViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.
//


import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subheaderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageButton: UIButton!
    
    
    var header = ""
    var subheader = ""
    var imageFile = ""
    //тк мы хотим в одном вью контроллере поместить несколько, то мы будем обращаться к ним по индексу
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = header
        subheaderLabel.text = subheader
        imageView.image = UIImage(named: imageFile)
        
        
        pageButton.layer.cornerRadius = 15
        pageButton.clipsToBounds = true //если мы это не напишем, то у нас останется такая же прямоугольная кнопка как и была
        pageButton.layer.borderWidth = 2
        pageButton.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        pageButton.layer.borderColor = (#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)).cgColor
        pageButton.setTitle("Отлично, начнем!", for: .normal)


    }
    

   

}

