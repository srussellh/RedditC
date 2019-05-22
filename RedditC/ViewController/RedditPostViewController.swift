//
//  RedditPostViewController.swift
//  RedditC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class RedditPostViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        SRHRedditPostController.shared().fetchPosts { (success) in
            if success{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else{
                print("its a trap!!!!")
            }
        }
    }
    

}

extension RedditPostViewController: UITableViewDataSource, UITableViewDelegate {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return SRHRedditPostController.shared().posts.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
    
    let post = SRHRedditPostController.shared().posts[indexPath.row]
    SRHRedditPostController.shared().fetchImage(for: post) { (image) in
        DispatchQueue.main.async {
            cell.imageView?.image = image
        }
    }
    
    cell.textLabel?.text = post.title
    
    
    
    return cell
}

}
