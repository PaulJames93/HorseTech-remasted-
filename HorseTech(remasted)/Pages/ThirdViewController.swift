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
    @IBOutlet weak var skipButton: UIButton!
    
    
    let header = "Выберите тип вашего велосипеда"
    let images = Images()
    
    var crossButton = false
    var cityButton = false
    var roadButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = header
        
        //настройка кнопки Сохранения
        doneButton.layer.cornerRadius = 15
        doneButton.clipsToBounds = true
        doneButton.layer.borderWidth = 2
        doneButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        doneButton.tintColor = .white
        doneButton.setTitle("          Стартуем!          ", for: .normal)
        
        //настройка кнопки назад
        
        skipButtonSetup()
        
        // настройка картинкок с велосипедами
        defaultSettingButton()
        
    }
    
    func skipButtonSetup(){
        skipButton.layer.cornerRadius = 15
        skipButton.clipsToBounds = true
        skipButton.layer.borderWidth = 2
        skipButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        skipButton.layer.borderColor = (#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)).cgColor
        skipButton.setTitle("  Назад  ", for: .normal)
    }
    
    func defaultSettingButton() {
        crossContryButton.layer.cornerRadius = 15
        crossContryButton.clipsToBounds = true
        crossContryButton.layer.borderWidth = 5
        crossContryButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        citybikeButton.layer.cornerRadius = 15
        citybikeButton.clipsToBounds = true
        citybikeButton.layer.borderWidth = 5
        citybikeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        roadBikeButton.layer.cornerRadius = 15
        roadBikeButton.clipsToBounds = true
        roadBikeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        roadBikeButton.layer.borderWidth = 5
        
        crossContryButton.setBackgroundImage(UIImage(named: "Горный"), for: .normal)
        citybikeButton.setBackgroundImage(UIImage(named: "Городской"), for: .normal)
        roadBikeButton.setBackgroundImage(UIImage(named: "Шоссейный"), for: .normal)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {

        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "wasIntroWatched")
        userDefaults.synchronize() // она помогает чтобы данные корректно записались
        
        // улучшенная логика сохранения при выборе кнопок
        if crossButton == true {
            let save = images
            save.image = "Горный"
            StorageManagerImages.saveObject(save)
        } else if cityButton == true {
            let save1 = images
            save1.image = "Городской"
            StorageManagerImages.saveObject(save1)
        } else if roadButton == true {
            let save2 = images
            save2.image = "Шоссейный"
            StorageManagerImages.saveObject(save2)
        }
        
    }
    
    @IBAction func crossContryPressed(_ sender: Any) {

        crossContryButton.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        citybikeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        roadBikeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        crossButton = true
        
        //сохранение данных в Realm
//        let save = images
//        save.image = "Горный"
//        StorageManagerImages.saveObject(save)
    }
    @IBAction func cityBikePressed(_ sender: Any) {

        crossContryButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        citybikeButton.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        roadBikeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cityButton = true

        
        //сохранение данных в Realm
//        let save1 = images
//        save1.image = "Городской"
//        StorageManagerImages.saveObject(save1)
    }
    @IBAction func roadBikePressed(_ sender: Any) {

        crossContryButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        citybikeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        roadBikeButton.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        roadButton = true
        
        //сохранение данных в Realm
//        let save2 = images
//        save2.image = "Шоссейный"
//        StorageManagerImages.saveObject(save2)
        
    }
    
    @IBAction func skipButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
//    

}
