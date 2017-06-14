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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLiveList", let destination = segue.destination as? MainListViewController {
            //            destination.viewModel = AFLiveListViewModel()
        }
    }
}

