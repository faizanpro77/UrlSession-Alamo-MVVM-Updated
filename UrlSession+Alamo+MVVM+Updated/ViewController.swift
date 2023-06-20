//
//  ViewController.swift
//  UrlSession+Alamo+MVVM+Updated
//
//  Created by MD Faizan on 17/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    let viewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        
        viewModel.fetchDetails()
        setup()
        
    }
    
    
    func setup() {
        viewModel.reload = { [weak self] in
            print("reload data =====>")
            DispatchQueue.main.async {
                self?.tblView.reloadData()
            }
            
        }
    }
}



extension  ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        cell?.modelUser = viewModel.userData[indexPath.row]
        
        return cell!
        
    }
    
    
}
