React= require 'react'
{ Component } = require 'react'
{ SHOW_ALL, SHOW_COMPLETED, SHOW_ACTIVE }= require '../../constants/filters.cjsx'
classnames= require 'classnames'
style= require './style.css'

FILTER_TITLES =
  "#{SHOW_ALL}": 'All',
  "#{SHOW_ACTIVE}": 'Active',
  "#{SHOW_COMPLETED}": 'Completed'

class Footer extends Component
    renderTodoCount: ()->
        { activeCount } = @props
        itemWord= if activeCount is 1 then 'item' else 'items'

        return (
          <span className={style.count}>
            <strong>{activeCount || 'No'}</strong> {itemWord} left
          </span>
        )

    renderFilterLink: (filter)->
        title = FILTER_TITLES[filter]
        { filter: selectedFilter, onShow } = @props
        return (
          <a className={classnames({ selected: filter is selectedFilter })}
             style={{ cursor: 'pointer' }}
             onClick={() => onShow(filter)}>
            {title}
          </a>
        )

    renderClearButton: ()->
        { completedCount, onClearCompleted } = @props
        if completedCount > 0
            return (
                <button className={style.clearCompleted} onClick={onClearCompleted} >
                  Clear completed
                </button>
            )

    render: ()->
        return (
          <footer className={style.normal}>
            {@renderTodoCount()}
            <ul className={style.filters}>
              {[SHOW_ALL, SHOW_ACTIVE, SHOW_COMPLETED].map( (filter) =>
                <li key={filter}>
                  {@renderFilterLink(filter)}
                </li>
              )}
            </ul>
            {@renderClearButton()}
          </footer>
        )
module.exports= Footer