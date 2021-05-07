//
//  Store.swift
//  CombineRedux
//
//  Created by Damodar, Namala (623-Extern) on 07/05/21.
//

import Foundation

public let store = Store<MathAction,MathState>(state: MathState(), reducer: appReducer)

public struct MathState {
    var number = 0
}

public enum MathAction {
    case plus(Int)
    case minus(Int)
}


typealias Reducer<State, Action> = (inout State, Action) -> State

func appReducer(state: inout MathState,
                action: MathAction) -> MathState {
    switch action {
    case let .minus(number):
        state.number -= number
    case let .plus(number):
        state.number += number
    }
    return state
}

public class Store<Action,State> {
    var reducer: Reducer<MathState, MathAction>
    var state: MathState

    init(state: MathState, reducer: @escaping Reducer<MathState, MathAction>) {
        self.reducer = reducer
        self.state = state
    }

    func send(action: MathAction) -> MathState {
        return  self.reducer(&state, action)
    }
}

