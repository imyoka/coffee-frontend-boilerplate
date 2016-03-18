{ Router, Route, browserHistory } = require 'react-router'
{ syncHistoryWithStore } = require 'react-router-redux'
{ Provider } = require 'react-redux'
ReactDOM= require 'react-dom'
React= require 'react'

# to be write
App= require './containers/App/index.cjsx'
configure= require './store/index.cjsx'

store= configure()
history= syncHistoryWithStore(browserHistory, store)

ReactDOM.render (
        <Provider store={store}>
                <Router history={history}>
                        <Route path='/' component={App}>
                        </Route>
                </Router>
        </Provider>
), document.getElementById('root')
