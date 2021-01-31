//
//  SecondPageViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.
//


//MARK: здесь мы хотим сохранить имя пользователя через CoreData

import UIKit
import RealmSwift

class SecondPageViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    
    let header = "Познакомимся?"
    let subHearder = "Введите ваше имя"
    let person = Person()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = header
        subHeaderLabel.text = subHearder
        
        
        imageView.image = UIImage(named: "Фото2")
        
        //настройка текстФилда
        setupTextField()
        
        //настройки кнопки
        setupButton()
        
//        textField.becomeFirstResponder()
        }
    
    func setupTextField() {
        textField.delegate = self
        textField.placeholder = "Имя"
        textField.returnKeyType = .done
    }
    
    //клава прячется после нажатия на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupButton() {
        button.layer.cornerRadius = 15
        button.clipsToBounds = true //если мы это не напишем, то у нас останется такая же прямоугольная кнопка как и была
        button.layer.borderWidth = 2
        button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        button.layer.borderColor = (#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)).cgColor
        button.setTitle("Дальше", for: .normal)
        
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        guard let title = textField.text, !title.isEmpty else {return}
       
        let name = person
        name.name = title
        
    StorageManagerName.saveObject(name)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    

}
