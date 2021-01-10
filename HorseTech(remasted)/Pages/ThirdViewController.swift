//
//  ThirdViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.
//

import UIKit
import RealmSwift

class ThirdViewController: UIViewController {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var crossContryButton: UIButton!
    @IBOutlet weak var citybikeButton: UIButton!
    @IBOutlet weak var roadBikeButton: UIButton!
    let header = "Выберите тип вашего велосипеда"
    let images = Images()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = header
        
        //настройка кнопки
        doneButton.layer.cornerRadius = 15
        doneButton.clipsToBounds = true
        doneButton.layer.borderWidth = 2
        doneButton.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        doneButton.layer.borderColor = (#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)).cgColor
        

        
        // фон картинкок с велосипедами
        
        crossContryButton.layer.cornerRadius = 15
        crossContryButton.clipsToBounds = true
        crossContryButton.setBackgroundImage(UIImage(named: "Горный"), for: .normal)
        crossContryButton.setTitle(nil, for: .normal)
        
        citybikeButton.layer.cornerRadius = 15
        citybikeButton.clipsToBounds = true
        citybikeButton.setBackgroundImage(UIImage(named: "Городской"), for: .normal)
        citybikeButton.setTitle(nil, for: .normal)
        
        roadBikeButton.layer.cornerRadius = 15
        roadBikeButton.clipsToBounds = true
        roadBikeButton.setBackgroundImage(UIImage(named: "Шоссейный"), for: .normal)
        roadBikeButton.setTitle(nil, for: .normal)

        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {

        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "wasIntroWatched")
        userDefaults.synchronize() // она помогает чтобы данные корректно записались
    }
    
    @IBAction func crossContryPressed(_ sender: Any) {
        //меняется цвет при нажатии
        roadBikeButton.backgroundColor = .none
        citybikeButton.backgroundColor = .none
        crossContryButton.backgroundColor = .white
        
        //меняется бэк при нажатии
        crossContryButton.setBackgroundImage(nil, for: .normal)
        citybikeButton.setBackgroundImage(UIImage(named: "Городской"), for: .normal)
        roadBikeButton.setBackgroundImage(UIImage(named: "Шоссейный"), for: .normal)
        //title
        crossContryButton.setTitle("Горный", for: .normal)
        citybikeButton.setTitle(nil, for: .normal)
        roadBikeButton.setTitle(nil, for: .normal)
        
        //сохранение данных в Realm
        let save = images
        save.image = "Горный"
        StorageManagerImages.saveObject(save)
    }
    @IBAction func cityBikePressed(_ sender: Any) {

        roadBikeButton.backgroundColor = .none
        citybikeButton.backgroundColor = .white
        crossContryButton.backgroundColor = .none
        
        crossContryButton.setBackgroundImage(UIImage(named: "Горный"), for: .normal)
        citybikeButton.setBackgroundImage(nil, for: .normal)
        roadBikeButton.setBackgroundImage(UIImage(named: "Шоссейный"), for: .normal)
        
        
        //title
        crossContryButton.setTitle(nil, for: .normal)
        citybikeButton.setTitle("Городской", for: .normal)
        roadBikeButton.setTitle(nil, for: .normal)
        
        //сохранение данных в Realm
        let save1 = images
        save1.image = "Городской"
        StorageManagerImages.saveObject(save1)
    }
    @IBAction func roadBikePressed(_ sender: Any) {
//меняется цвет при нажатии
        roadBikeButton.backgroundColor = .white
        citybikeButton.backgroundColor = .none
        crossContryButton.backgroundColor = .none
        
        crossContryButton.setBackgroundImage(UIImage(named: "Горный"), for: .normal)
        citybikeButton.setBackgroundImage(UIImage(named: "Городской"), for: .normal)
        roadBikeButton.setBackgroundImage(nil, for: .normal)
        
        //title
        crossContryButton.setTitle(nil, for: .normal)
        citybikeButton.setTitle(nil, for: .normal)
        roadBikeButton.setTitle("Шоссейный", for: .normal)
        
        //сохранение данных в Realm
        let save2 = images
        save2.image = "Шоссейный"
        StorageManagerImages.saveObject(save2)
    }
    

}
