//
//  mvc_to_mvvm_mvcTests.swift
//  mvc_to_mvvm_mvcTests
//
//  Created by Nathan Ranghel on 01/08/19.
//  Copyright © 2019 Nathan Ranghel. All rights reserved.
//

import XCTest
@testable import mvc_to_mvvm_mvc

class mvc_to_mvvm_mvcTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMobileViewModel() {
        let course = MobilePlataform(id: 0, name: "mobile", programers: 10)
        let courseViewModel = MobilePlataformViewModel(platform: course)
        
        // what is it that we want to test?
        XCTAssertEqual(course.name, courseViewModel.name)
        XCTAssertEqual("Programadores: \(course.programers)", courseViewModel.detailTextString)
        XCTAssertEqual(.none, courseViewModel.accessoryType)
    }
    
    func testMobileViewModelWithRequest() {
        var mobilePlataformViewModels:[MobilePlataformViewModel] = [MobilePlataformViewModel]()
        Service.shared.fetchPlataforms { (courses, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
           mobilePlataformViewModels = courses?.map({return MobilePlataformViewModel(platform: $0)}) ?? []
           XCTAssertEqual("Os melhores com Programadores: 100000",mobilePlataformViewModels.first?.detailTextString)
        }
      
        
    }
    func testMobileViewModelLessonsOverThreshold() {
        let course = MobilePlataform(id: 0, name: "mobile", programers: 100)
        let courseViewModel = MobilePlataformViewModel(platform: course)
        
        XCTAssertEqual("Os melhores com Programadores: \(course.programers)", courseViewModel.detailTextString)
        XCTAssertEqual(.detailDisclosureButton, courseViewModel.accessoryType)
    }
    
    
    

}
