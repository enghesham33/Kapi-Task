//
//  Kapi_TaskPostsListTests.swift
//  Kapi-TaskTests
//
//  Created by Hesham Donia on 27/11/2023.
//

import Foundation
import XCTest
@testable import Kapi_Task

final class Kapi_TaskPostsListTests: XCTestCase {
    
    var viewModel: PostsListViewModel?

    override func setUpWithError() throws {
        viewModel = AppDelegate.container.resolve(PostsListViewModel.self)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDependencyInjectionForViewModel() throws {
        XCTAssertTrue(viewModel != nil)
    }
    
    func testDependencyInjectionForRepository() throws {
        XCTAssertTrue(viewModel?.repository != nil)
    }

}
