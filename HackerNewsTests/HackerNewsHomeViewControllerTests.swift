//
//  HackerNewsTests.swift
//  HackerNewsTests
//
//  Created by Anthony Beckford on 9/26/22.
//

import XCTest
@testable import HackerNews

// RED -> GREEN -> REFACTOR
class HackerNewsHomeViewControllerTests: XCTestCase {
    //Refactoring
    
    var systemUnderTest: HomeViewController!
    
    override func setUp() {
        super.setUp()
        systemUnderTest = HomeViewController()
    }
    
    override func tearDown() {
        systemUnderTest = nil
        super.tearDown()
    }
    
    
    func test_didSetTitleForVC() {
        // when
        systemUnderTest.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(systemUnderTest.title, "HackerNews")
    }
    
    
    func test_didCongfigureTableViewDelegateAndDataSource() {
        // when
        systemUnderTest.loadViewIfNeeded()
        // then
        
        XCTAssertNotNil(systemUnderTest.tableView.delegate)
        XCTAssertNotNil(systemUnderTest.tableView.delegate)
    }
    
    // How to create your test
    
    func test_tableViewShouldBeEmpty() {
    // when
        systemUnderTest.articles = []
        systemUnderTest.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(systemUnderTest.tableView.numberOfRows(inSection: 0), 0)
    }
    
    // Testing the tableview that has one cell
    
    func test_tableViewHasOneItem() {
       // when
        systemUnderTest.articles.append(Article())
        systemUnderTest.loadViewIfNeeded()
        
        
        // then
        XCTAssertEqual(systemUnderTest.tableView.numberOfRows(inSection: 0), 1)
    }
    
    // Create a test where the home view has alot of tables
    
    
    func test_tableViewHasManyItems() {
       //given
        let articles = [Article(), Article(), Article(), Article()]
        
        
        
        
        
        //when
        systemUnderTest.articles = articles
        systemUnderTest.loadViewIfNeeded()
        
        // then
        
        XCTAssertEqual(systemUnderTest.tableView.numberOfRows(inSection: 0), articles.count)
    }
}


