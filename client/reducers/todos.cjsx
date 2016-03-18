{ handleActions } = require 'redux-actions'

initialState = [{
  text: 'Use Redux',
  completed: false,
  id: 0
}]

module.exports= handleActions({
    'add todo': (state, action)->
        return [{
          id: state.reduce(((maxId, todo) => Math.max(todo.id, maxId)), -1) + 1,
          completed: false,
          text: action.payload
        }, state...]
    'delete todo': (state, action)->
        return state.filter( (todo) => todo.id isnt action.payload )
    'edit todo': (state, action)->
        return state.map (todo) =>
          if todo.id is action.payload.id
            return Object.assign {}, todo, { text: action.payload.text }
          else
            return todo
    'complete todo': (state, action)->
        return state.map (todo) =>
          if todo.id is action.payload
            return Object.assign {}, todo, { completed: !todo.completed }
          else
            return todo

    'complete all': (state, action)->
        areAllMarked = state.every((todo) => todo.completed)
        return state.map (todo) =>
          return Object.assign {}, todo, { completed: !areAllMarked }
    'clear complete': (state, action)->
        return state.filter((todo) => todo.completed is false)
}, initialState)