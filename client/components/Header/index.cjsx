React= require 'react'
{ Component } = require 'react'
TodoTextInput = require '../TodoTextInput/index.cjsx'

class Header extends Component
    handleSave: (text)-> if text.length then @props.addTodo(text)

    render: ()->
        return (
          <header>
            <h1>Todos</h1>
            <TodoTextInput
              newTodo
              onSave={@handleSave.bind(@)}
              placeholder="What needs to be done！！？" />
          </header>
        )
module.exports= Header