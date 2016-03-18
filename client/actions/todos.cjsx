{ createAction }= require 'redux-actions'

module.exports=
    addTodo: createAction('add todo')
    deleteTodo: createAction('delete todo')
    editTodo: createAction('edit todo')
    completeTodo: createAction('complete todo')
    completeAll: createAction('complete all')
    clearCompleted: createAction('clear complete')