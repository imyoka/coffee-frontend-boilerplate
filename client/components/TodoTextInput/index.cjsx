React= require 'react'
{ Component } = require 'react'
classnames = require 'classnames'
style = require './style.css'

class TodoTextInput extends Component
    constructor: (props, context)->
        super(props, context)
        @state= {
            text: @props.text || ''
        }

    handleSubmit: (e)->
        text = e.target.value.trim()
        if e.which is 13
            @props.onSave(text)
            if @props.newTodo
                @setState {text: ''}

    handleChange: (e)->
        @setState { text: e.target.value }

    handleBlur: (e)->
        text= e.target.value.trim()
        unless @props.newTodo then @props.onSave(text)

    render: ()->
        classes= classnames {
            "#{style.edit}": @props.editing
            "#{style.new}": @props.newTodo
        }, style.normal

        return (
            <input className={classes}
                type="text"
                autoFocus="true"
                placeholder={@props.placeholder}
                value={@state.text}
                onBlur={@handleBlur.bind(@)}
                onChange={@handleChange.bind(@)}
                onKeyDown={@handleSubmit.bind(@)} />
        )

module.exports= TodoTextInput