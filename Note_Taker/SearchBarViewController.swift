//
//  SearchBarViewController.swift
//  Note_Taker
//
//  Created by Jason Mai on 12/7/21.
//

import UIKit
import Parse
import AlamofireImage

class SearchBarViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var courses = ["MTH142"]
    
    var searchCourse = [String]()
    var searching = false
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        var query = PFQuery(className: "Course")
        query.findObjectsInBackground { (objects, error) -> Void in
            if error == nil {
                // there was no error in fetch
            }
            if let returnedobjects = objects {
                for object in returnedobjects {
                    if(self.courses.contains(object["courseNumber"] as! String) == false){
                        self.courses.append(object["courseNumber"] as! String)
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    // Mark: -Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        // Pass the selected object to the new view controller
        
        print("loading course")
        let cell = sender as! UITableViewCell
        let indexPath = searchTableView.indexPath(for: cell)!
        let searchChosen = courses[indexPath.row]
        
        let searchResultViewController = segue.destination as! SearchResultViewController
        
        searchResultViewController.courseSearch = searchChosen
        
    }
}

extension SearchBarViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchCourse.count
        }
        else{
            return courses.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells")
        if searching {
            cell?.textLabel?.text = searchCourse[indexPath.row]
        }
        else{
            cell?.textLabel?.text = courses[indexPath.row]
        }
        return cell!
    }
}

extension SearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCourse = courses.filter({$0.prefix(searchText.count).uppercased() == searchText.uppercased()})
        searching = true
        searchTableView.reloadData()
    }
}
