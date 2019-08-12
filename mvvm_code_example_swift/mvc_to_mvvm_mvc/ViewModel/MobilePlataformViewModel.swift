//
//  CourseViewModel.swift
//  mvc_to_mvvm_mvc
//
//  Created by Nathan Ranghel on 01/08/19.
//  Copyright © 2019 Nathan Ranghel. All rights reserved.
//

import Foundation
import UIKit

struct MobilePlataformViewModel {
    
    let name: String
    
    let detailTextString: String
    let accessoryType: UITableViewCell.AccessoryType
    
    // Dependency Injection (DI)
    init(platform: MobilePlataform) {
        self.name = platform.name
        
        if platform.programers > 35 {
            detailTextString = "Os melhores com Programadores: \(platform.programers)"
            accessoryType = .detailDisclosureButton
        } else {
            detailTextString = "Programadores: \(platform.programers)"
            accessoryType = .none
        }
    }
    
}

