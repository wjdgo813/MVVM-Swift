//
//  ViewController.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 5. 25..
//  Copyright © 2017년 JHH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         // navigation color 변경
        self.navigationController?.navigationBar.tintColor = UIColor.red
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        
        //navigation title color 변경
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        //navigation title string 변경
        self.navigationItem.title = "Main"
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressedMVVM(_ sender: Any) {
        let nextVC = MainListViewController()
        nextVC.title = "List"
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showLiveList", let destination = segue.destination as? MainListViewController {
//            //            destination.viewModel = AFLiveListViewModel()
//        }
//    }
}

