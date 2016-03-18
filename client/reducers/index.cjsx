routing= require('react-router-redux').routerReducer
{ combineReducers }= require 'redux'
todos= require './todos.cjsx'

module.exports= combineReducers({
  routing,
  todos
})

# ===> function(state= {}, action) {
#          routing: routing(state.routing, action)
#          todos: todos(state.todos, action)
# }