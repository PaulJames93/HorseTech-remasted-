//
//  UserViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.


import UIKit
import RealmSwift


class UserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeBikeLabel: UILabel!
    @IBOutlet weak var imageBike: UIImageView!
    @IBOutlet weak var changeTypeButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //настройки для кнопки
        changeTypeButton.layer.cornerRadius = 15
        changeTypeButton.clipsToBounds = true
        changeTypeButton.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        changeTypeButton.layer.borderWidth = 2
        changeTypeButton.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        changeTypeButton.setTitle("Изменить", for: .normal)
        changeTypeButton.tintColor = .white
        
        
        //извлечение данных из Realm
        fetch()
        fetch2()
    }

    //извлечение имени
    func fetch() {
        let people = realm.objects(Person.self)
        for person in people{
            let name = person.name
            nameLabel.text = name
        }
    }
    
    //извлечение картинки
    func fetch2() {
        let image = realm.objects(Images.self)
        for img in image{
            let qwerty = img.image
            
            switch qwerty {
            case "Горный":
                imageBike.image = UIImage(named: "Горный")
                typeBikeLabel.text = "Горный"
            case "Городской":
                imageBike.image = UIImage(named: "Городской")
                typeBikeLabel.text = "Городской"
            case "Шоссейный":
                imageBike.image = UIImage(named: "Шоссейный")
                typeBikeLabel.text = "Шоссейный"
                
            default:
                break
            }
        }
    }
    
    
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        
    }
  
}
