//
//  Store.swift
//  CombineRedux
//
//  Created by Damodar, Namala (623-Extern) on 07/05/21.
//

import Foundation

let store = Store<MathAction,MathState>(state: MathState(), reducer: appReducer)
let postsStore = PostStore<PostsActions,PostState>(state: PostState(posts: []), reducer: postsReducer)

struct MathState {
    var number = 0
}

enum MathAction {
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

class Store<Action,State> {
    var reducer: Reducer<MathState, MathAction>
    var state: MathState

    init(state: MathState, reducer: @escaping Reducer<MathState, MathAction>) {
        self.reducer = reducer
        self.state = state
    }

    func send(action: MathAction) -> MathState {
        self.state =  self.reducer(&state, action)
        return state
    }
}

struct Post {
    var id: Int
    var userID: Int
    var body: String
    var title: String
}

struct PostState {
    var posts: [Post] = []
}

struct PostService {
    func all() -> PostState {
        return PostState(posts: [Post(id: 1,
                                      userID: 1,
                                      body: "Sample body",
                                      title: "First")])
    }
}

enum PostsActions {
    case all
}

public class PostStore<Action,State> {
    var reducer: Reducer<PostState, PostsActions>
    var state: PostState

    init(state: PostState, reducer: @escaping Reducer<PostState, PostsActions>) {
        self.reducer = reducer
        self.state = state
    }

    func send(action: PostsActions) -> PostState {
        return  self.reducer(&state, action)
    }
}

func postsReducer(state: inout PostState,
                  action: PostsActions) -> PostState {
    switch action {
    case .all:
        let service = PostService()
        state = service.all()
    }
    return state
}

