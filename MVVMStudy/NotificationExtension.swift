//
//  NotificationExtension.swift
//  MVVMStudy
//
//  Created by JHH on 2017. 6. 13..
//  Copyright © 2017년 JHH. All rights reserved.
//

import Foundation

extension Notification.Name{
    struct Model {
        static let changedLists: Notification.Name = Notification.Name("changedListsInModel")
    }
    
    struct ViewModel {
        static let changedLists: Notification.Name = Notification.Name("changedListsInViewModel")
    }
}
