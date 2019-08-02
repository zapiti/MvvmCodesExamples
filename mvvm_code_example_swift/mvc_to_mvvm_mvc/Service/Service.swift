//
//  Service.swift
//  mvc_to_mvvm_mvc
//
//  Created by Nathan Ranghel on 01/08/19.
//  Copyright © 2019 Nathan Ranghel. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchPlataforms(completion: @escaping ([MobilePlataform]?, Error?) -> ()) {
        
        var plats = [MobilePlataform]()
        
        let android = MobilePlataform(id: 0, name:"android", programers: 100000)
        let ios = MobilePlataform(id: 0, name:"iOS", programers: 1000)
        let flutter = MobilePlataform(id: 0, name:"Flutter", programers: 100)
        let react = MobilePlataform(id: 0, name:"React", programers: 10)
        
        plats.append(android)
        plats.append(ios)
        plats.append(flutter)
        plats.append(react)
     //   DispatchQueue.main.async {
                completion(plats, nil)
      //  }
    }
}

