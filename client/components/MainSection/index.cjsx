React= require 'react'
{ Component } = require 'react'
TodoItem = require '../TodoItem/index.cjsx'
Footer = require '../Footer/index.cjsx'
{ SHOW_ALL, SHOW_COMPLETED, SHOW_ACTIVE } = require '../../constants/filters.cjsx'
style = require './style.css'

TODO_FILTERS=
    "#{SHOW_ALL}": () => true
    "#{SHOW_ACTIVE}": (todo) => !todo.completed
    "#{SHOW_COMPLETED}": (todo) => todo.completed

class MainSection extends Component
    constructor: (props, context)->
        super props, context
        @state = { filter: SHOW_ALL}

    handleClearCompleted: ()->
        atLeastOneCompleted= @props.todos.some (todo) => todo.completed
        if atLeastOneCompleted then @props.actions.clearCompleted()

    handleShow: (filter)-> @setState { filter }

    renderToggleAll: (completedCount)->
        { todos, actions } = @props
        if todos.length > 0
            return (
                <input
                    className={style.toggleAll}
                    type="checkbox"
                    checked={completedCount is todos.length}
                    onChange={actions.completeAll} />
            )

    renderFooter: (completedCount)->
        { todos } = @props
        { filter } = @state
        activeCount = todos.length - completedCount

        if todos.length
            return (
                <Footer completedCount={completedCount}
                    activeCount={activeCount}
                    filter={filter}
                    onClearCompleted={@handleClearCompleted.bind(@)}
                    onShow={@handleShow.bind(@)} />
            )

    render: ()->
        { todos, actions } = @props
        { filter } = @state
        filteredTodos = todos.filter(TODO_FILTERS[filter])
        completedCount = todos.reduce( ((count, todo) => return if todo.completed then count + 1 else count), 0)

        return (
            <section className={style.main}>
                {@renderToggleAll(completedCount)}
                <ul className={style.normal}>
                  {filteredTodos.map( (todo) =>
                    <TodoItem key={todo.id} todo={todo} {...actions} />
                  )}
                </ul>
                {@renderFooter(completedCount)}
            </section>
        )

module.exports= MainSection