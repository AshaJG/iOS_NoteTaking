//
//  SearchResultViewController.swift
//  Note_Taker
//
//  Created by Jason Mai on 12/7/21.
//

import UIKit
import Parse
import AlamofireImage

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var courseSearch = ""

    @IBOutlet weak var searchResultTable: UITableView!
    
    var posts = [PFObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultTable.delegate = self
        searchResultTable.dataSource = self
        
        let query = PFQuery(className: "Course")
        query.includeKey("user")
        query.limit = 30
        
        query.findObjectsInBackground{ (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.searchResultTable.reloadData()
            }
        }

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    
    //unfinished
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        let post = posts[indexPath.row]
        if(post["courseNumber"] as! String == courseSearch){

            let user = post["user"] as! PFUser
            cell.searchName.text = user.username
            cell.searchDescription.text = (post["caption"] as! String)
            cell.searchTag.text = (post["hashtags"] as! String)
            cell.searchCourse.text = (post["courseNumber"] as! String)
            
            let imageFile = post["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            
            cell.searchImage.af.setImage(withURL: url)
            return cell
        }
        return cell
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
