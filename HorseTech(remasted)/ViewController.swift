//
//  ViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.
//


import UIKit


class ViewController: UIViewController {
    //MARK: Properties
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notFoundLabel: UILabel!
    @IBOutlet weak var viewForHeader: UIView!
    
    private let articles = [Article(name: .firstTitle, image: .firstPage, text: .firstCell, textAdvice: .firstCell, video: .firstVideo, difficulty: .easy),
                            Article(name: .secondTitle, image: .secondPage, text: .secondCell, textAdvice: .secondCell, video: .secondVideo, difficulty: .medium),
                            Article(name: .thirdTitle, image: .thirdPage, text: .thirdCell, textAdvice: .thirdCell, video: .thridVideo, difficulty: .high)]
    
//    private let articles = [Article(name: "Как и чем смазывать цепь", image: .firstPage, text: .firstCell),
//                    Article(name: "Как исправить восьмерку на колесе", image: .secondPage, text: .secondCell),
//                    Article(name: "Как настроить передачи (манетки)", image: .thirdPage, text: .thirdCell),
//                    Article(name: "Как заделать прокол в камере", image: .thirdPage, text: .thirdCell),
//                    Article(name: "Как правильно пристегивать велописпед", image: .thirdPage, text: .thirdCell),
//                    Article(name: "Слетает цепь: что делать?", image: .thirdPage, text: .thirdCell),
//                    Article(name: "Как менять камеру и покрышку на колесе", image: .thirdPage, text: .thirdCell),
//                    Article(name: "Как и чем чистить велосипед", image: .thirdPage, text: .thirdCell),
//                    Article(name: "Как устранить скрип при езде", image: .thirdPage, text: .thirdCell),
//                    Article(name: "Стук в педалях: что делать?", image: .thirdPage, text: .thirdCell),
//
//    ]
    
    //MARK: for Favourite List
    
//    var favArray:[String] = []
    
    // MARK: for searchController
    let searchController = UISearchController(searchResultsController: nil)
    
 
    
    
    private var filteredArticles = [Article]()
    private var searchBarIsEmpty:Bool{
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    private var isFiltering: Bool{
        return searchController.isActive && !searchBarIsEmpty
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
       //SearchController настройки
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Найти..."
        searchController.searchBar.tintColor = .black //бегунок
        searchController.searchBar.searchTextField.backgroundColor = .white
        
       
     
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        //изменяем текст рядом с searchTextField вместо Cancel
        navigationItem.searchController = searchController
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Закрыть"
        
        //убрать слово "back" из навигейшена
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //изменение цвета backButtonItem
        navigationController?.navigationBar.tintColor = .black
        
        
//MARK: тестовые изменения
        
//        tableView.layer.cornerRadius = 30
        viewForHeader.layer.cornerRadius = 30
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //сохранение просмотра INTRO
        
        let userDefaults = UserDefaults.standard
        let wasIntroWatched = userDefaults.bool(forKey: "wasIntroWatched")
        guard !wasIntroWatched else {return} // если вот это фолс, то мы продолжаем выполнять наш код - то есть приветствие. Если тру, то останавливаемся
        
        if let pageViewController = storyboard?.instantiateViewController(identifier: "pageViewController") as? PageViewController {
            present(pageViewController, animated: true, completion: nil)
            
        }
    }
    
}
//MARK: TableView setup

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            setIsFiletringToShow(filteredItemCount: filteredArticles.count, of: articles.count)
            return filteredArticles.count
        } else {
            setNotFiltering()
            return articles.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleCell
        var article: Article
        if isFiltering {
            article = filteredArticles[indexPath.row]
        } else {
            article = articles[indexPath.row]
        }
        cell.labelText.text = article.name.rawValue
        cell.imageView?.image = UIImage(named: article.image.rawValue)
        cell.difficultyImage.image = UIImage(named: article.difficulty.rawValue)
        


        
        
        return cell
    }
    
   
    
   //MARK: попытка передать данные на другой вью
  
   
    
    
    //MARK: prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let article: Article
                
                if isFiltering {
                    article = filteredArticles[indexPath.row]
                } else {
                    article = articles[indexPath.row]
                }
                let detailVC = segue.destination as! ArticleViewController
                detailVC.article = article
            }
        }
    }
    
    
}

// MARK: Search Controller setup

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredArticles = articles.filter({ (article: Article) -> Bool in
            return article.name.rawValue.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    //настройка появления сообщения, есть ли совпадение в searchTextField или нет
    func setNotFiltering(){
        notFoundLabel.text = ""
        tableView.separatorStyle = .singleLine
        
    }
    
    func setIsFiletringToShow(filteredItemCount: Int, of totalItemCount: Int) {
        
        switch filteredItemCount {
        case 0:
            notFoundLabel.text = "Ничего не найдено.\n Повторите запрос"
            tableView.separatorStyle = .none
        default:
            break
        }
        
    }
}



