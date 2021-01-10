//
//  FavouritesTableViewController.swift
//  HorseT
//
//  Created by Paul James on 11.10.2020.
//  Copyright © 2020 Paul James. All rights reserved.
//

import UIKit

class FavouritesTableViewController: UITableViewController {
    
 
    var article = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return article.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)

//        cell.textLabel?.text = article[indexPath.row]
        
        return cell
    }

}
