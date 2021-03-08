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
    
    private let articles = [
        
                            Article(name: .firstTitle, image: .firstPage, text: .firstCell, textAdvice: .firstCell, video: .firstVideo, difficulty: .easy),
                            //как исправить восьмерку
                            Article(name: .secondTitle, image: .secondPage, text: .secondCell, textAdvice: .secondCell, video: .secondVideo, difficulty: .high),
                            //как настроить переключение передач
                            Article(name: .thirdTitle, image: .thirdPage, text: .thirdCell, textAdvice: .thirdCell, video: .thridVideo, difficulty: .medium),
                            //как подобрать велосипед
                            Article(name: .forthTitle, image: .fourPage, text: .fourCell, textAdvice: .fourCell, video: .forthVideo, difficulty: .easy),
                            //как заклеить камеру
                            Article(name: .fifthTitle, image: .fivePage, text: .fiveCell, textAdvice: .fiveCell, video: .fifthVideo, difficulty: .easy),
                            // как перевозить велосипед в электричке
                            Article(name: .sixthTitle, image: .sixPage, text: .sixCell, textAdvice: .sixCell, video: .sixthVideo, difficulty: .easy),
                            // как увеличить скорость велосипеда
                            Article(name: .seventhTitle, image: .sevenPage, text: .sevenCell, textAdvice: .sevenCell, video: .sevenVideo, difficulty: .easy),
                            //как правильно натсроить под себя велик
                            Article(name: .eightTitle, image: .eightPage, text: .eightCell, textAdvice: .eightCell, video: .eightVideo, difficulty: .easy),
                            //сколько качать в колесо
                            Article(name: . ninethTitle, image: .ninePage, text: .nineCell, textAdvice: .nineCell, video: .ninthVideo, difficulty: .easy),
                            //как правильно крутить педали
                            Article(name: . tenthTitle, image: .tenPage, text: .tenCell, textAdvice: .tenCell, video: .tenthVideo, difficulty: .easy),
                            // как подготовить велик к сезону
                            Article(name: . eleventhTitle, image: .elevenPage, text: .elevenCell, textAdvice: .elevenCell, video: .eleventhVideo, difficulty: .easy),
                            // что нужно для безопасного вождения
                            Article(name: . twelveTitle, image: .twelvePage, text: .twelveCell, textAdvice: .twelveCell, video: .twelvethVideo, difficulty: .easy)
    ]
    
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
        
        
//MARK: закругление краев у вью над tableView
        
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
    
   
    
   //MARK: передать данные на другой вью
  
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



