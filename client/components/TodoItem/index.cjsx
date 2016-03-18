React= require 'react'
{ Component } = require 'react'
TodoTextInput = require '../TodoTextInput/index.cjsx'
classnames = require 'classnames'
style = require './style.css'

class TodoItem extends Component
    constructor: (props, context)->
        super props, context
        @state= { editing: false }

    handleDoubleClick: ()->
        @setState { editing: true }

    handleSave: (id, text)->
        if text.length is 0
            @props.deleteTodo id
        else
            @props.editTodo { id, text }
        @setState { editing: false }

    render: ()->
        {todo, completeTodo, deleteTodo} = @props

        element= null
        if @state.editing
            element = (
                <TodoTextInput text={todo.text}
                   editing={@state.editing}
                   onSave={(text) => @handleSave(todo.id, text)} />
            )
        else
            element = (
                <div className={style.view}>
                  <input className={style.toggle}
                     type="checkbox"
                     checked={todo.completed}
                     onChange={() => completeTodo(todo.id)} />

                  <label onDoubleClick={@handleDoubleClick.bind(@)}>
                    {todo.text}
                  </label>

                  <button className={style.destroy} onClick={() => deleteTodo(todo.id)} />
                </div>
            )
        classes= classnames {
            "#{style.completed}": todo.completed
            "#{style.editing}": @state.editing
            "#{style.normal}": !@state.editing
        }
        return (
            <li className={classes}>
                {element}
            </li>
        )
module.exports= TodoItem