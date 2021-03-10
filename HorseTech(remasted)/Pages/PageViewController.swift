//
//  PageViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.
//


import UIKit

class PageViewController: UIPageViewController {
    
    var headerArray = ["Первая помощь для твоего велосипеда", "Как вас зовут?"]
    var subHeader = ["Используйте этот карманный справочник, чтобы оперативно починить свой велосипед, пользоваться им безопасно и эффективно. Мы постарались собрать только лучшие практики для того, чтобы ваш железный конь работал исправно как можно дольше!", "Меня зовут - "]
    var imagesArray = ["bike0","Bike2"]

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        //тут мы расписываем, что мы должны в первую очередь загружать
        if let firstVC = displayViewCOntroller(atIndex: 0) {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
      
    }
    
    func displayViewCOntroller(atIndex index: Int) -> ContentViewController? {
        guard  index >= 0 else {return nil} //нам нужно чтобы у нас индекс не был отрицательным
        guard index < headerArray.count else {return nil} // нам нужно чтобы наш индекс не был больше количества элементов в массиве
        guard let vc = storyboard?.instantiateViewController(identifier: "contentViewController") as? ContentViewController else {return nil}
        vc.header = headerArray[index]
        vc.subheader = subHeader[index]
        vc.imageFile = imagesArray[index]
        vc.index = index
        
        return vc
        
    }
    
    func nextVC (atIndex index:Int) {
        if let vc = displayViewCOntroller(atIndex: index + 1) {
            setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        }
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index -= 1
        return displayViewCOntroller(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        return displayViewCOntroller(atIndex: index)
    }
 
}
