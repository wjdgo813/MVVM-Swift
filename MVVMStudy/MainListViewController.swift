//
//  MainListViewController.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 13..
//  Copyright © 2017년 JHH. All rights reserved.
//

import UIKit

class MainListViewController: AFItemsTableViewController {

    var requestParameters : RequestParameter = RequestParameter()
    
    override func viewDidLoad() {
        delegate=self as! ItemsTableViewControllerDelegate
        viewModel = CarListViewModel()
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name.ViewModel.changedLists, object: nil)

        requestParameters.model = "Ferrari"
        requestParameters.make = "해혀니"
        requestParameters.horsePower = 10
        requestParameters.photoURL = "www.naver.com"
        
        self.viewModel.setParameter(requestParameters)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if viewModel.numberOfItems == 0 {
            self.viewModel.setParameter(requestParameters)
            viewModel.loadData()
        }
        
    }
}

extension MainListViewController : ItemsTableViewControllerDelegate{
    func itemsTableViewController(_ itemsTableViewController: AFItemsTableViewController, cellNibForType type: ItemCellType) -> UINib? {
        return UINib(nibName: "MainListTableViewCell", bundle: nil)
    }
    
    func itemsTableViewController(_ itemsTableViewController: AFItemsTableViewController, customCell cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let carCell = cell as? MainListTableViewCell,
            let cellViewModel = viewModel.itemCellViewModel(atIndex: indexPath.row) as? CarCellViewModel
    else{return cell}
        
        carCell.viewModel = cellViewModel
        
        return cell
    }
    
    func itemsTableViewController(_ itemsTableViewController: AFItemsTableViewController, didSelectItem item: Item, cellType: ItemCellType, atIndexPath indexPath: IndexPath) {
        
    }
}

