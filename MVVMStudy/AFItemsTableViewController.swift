//
//  AFItemsTableViewController.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 12..
//  Copyright © 2017년 JHH. All rights reserved.
//

import UIKit

protocol Item {
    
}

enum ItemCellType {
    case item
    case header
}

extension ItemCellType{
    func reuseIdentifier()->String{
        switch self {
        case .item:
            return "itemCell"
        case .header:
            return "headerCell"
        }
    }
}

protocol ItemsTableViewControllerDelegate:class {
    func itemsTableViewController(_ itemsTableViewController:AFItemsTableViewController,cellNibForType type: ItemCellType)->UINib?
    func itemsTableViewController(_ itemsTableViewController:AFItemsTableViewController,customCell cell : UITableViewCell,atIndexPath indexPath:IndexPath)->UITableViewCell
    func itemsTableViewController(_ itemsTableViewController:AFItemsTableViewController,didSelectItem item : Item, cellType:ItemCellType,atIndexPath indexPath : IndexPath)
}

class AFItemsTableViewController: UITableViewController {
    weak var delegate : ItemsTableViewControllerDelegate!
    var viewModel:ItemsViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(delegate != nil)
        assert(viewModel != nil)
        
        if let nib = delegate.itemsTableViewController(self,cellNibForType : .header){
            tableView.register(nib, forCellReuseIdentifier: ItemCellType.header.reuseIdentifier())
        }else{
            assertionFailure()
        }
        
        if let nib = delegate.itemsTableViewController(self,cellNibForType: .item){
            tableView.register(nib,forCellReuseIdentifier:ItemCellType.item.reuseIdentifier())
        }else{
            assertionFailure()
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = viewModel.itemCellType(atIndex: indexPath.row)
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: type.reuseIdentifier(), for: indexPath)
        return delegate.itemsTableViewController(self, customCell: cell, atIndexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.item(atIndex: indexPath.row)
        let type = viewModel.itemCellType(atIndex: indexPath.row)
        delegate.itemsTableViewController(self, didSelectItem: item, cellType: type, atIndexPath: indexPath)
    }
    

    func reload(){
        tableView.reloadData()
    }
}
