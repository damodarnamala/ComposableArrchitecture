//
//  MathSpecs.swift
//  CombineReduxTests
//
//  Created by Damodar, Namala (623-Extern) on 07/05/21.
//

import XCTest
@testable import CombineRedux

class StoreSpecs: XCTestCase {
    override class func setUp() {
        super.setUp()
    }

    func testStorePlusFunction() {
        let store = Store<MathAction,MathState>(state: MathState(number: 100),
                                                reducer: appReducer)
        let reult = store.send(action: .plus(100)).number
        XCTAssertTrue(reult == 200, "store minus plus failed")
    }

    func testStoreMinusFunction() {
        let store = Store<MathAction,MathState>(state: MathState(number: 200),
                                                reducer: appReducer)
        let reult = store.send(action: .minus(50)).number
        XCTAssertTrue(reult == 150, "store minus action failed")
    }
}

