//
//  MainListTableViewCell.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 14..
//  Copyright © 2017년 JHH. All rights reserved.
//

import UIKit

class MainListTableViewCell: UITableViewCell {

    @IBOutlet weak var horsePowerLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    
    var viewModel : CarCellViewModel?{
        didSet{
            display()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func display(){
        set(modelString: (viewModel?.model)!, makeString: (viewModel?.make)!, horsePowerInt: (viewModel?.horsePower)!)
    }
    
    private func set(modelString : String,makeString : String,horsePowerInt:Int){
        self.modelLabel.text = modelString
        self.makeLabel.text = makeString
        self.horsePowerLabel.text = String(horsePowerInt)
        
    }
    
}
