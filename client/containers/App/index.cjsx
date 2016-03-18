React= require 'react'
{ Component } = require 'react'
{ bindActionCreators } = require 'redux'
{ connect } = require 'react-redux'
Header = require '../../components/Header/index.cjsx'
MainSection = require '../../components/MainSection/index.cjsx'
TodoActions = require '../../actions/todos.cjsx'
style = require './style.css'

class App extends Component
    render: ->
        { todos, actions, children } = this.props
        return (
            <div className={style.normal}>
                <Header addTodo={actions.addTodo} />
                <MainSection todos={todos} actions={actions} />
                {children}
            </div>
        )

mapStateToProps= (state)->
    return {
        todos: state.todos
    }

mapDispatchToProps= (dispatch)->
    return {
        actions: bindActionCreators(TodoActions, dispatch)
    }

module.exports= connect( mapStateToProps, mapDispatchToProps )(App)