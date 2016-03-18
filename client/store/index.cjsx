{ createStore, applyMiddleware } = require 'redux'
# to be write
{ logger } = require '../middleware/index.cjsx'
rootReducer = require '../reducers/index.cjsx'

module.exports= configure= (initialState)->
    create= if window.devToolsExtension then window.devToolsExtension()(createStore) else createStore

    createStoreWithMiddleware= applyMiddleware(logger)(create)
    store= createStoreWithMiddleware(rootReducer, initialState)

    if module.hot
        module.hot.accept('../reducers/index.cjsx', () =>
                nextReducer = require('../reducers/index.cjsx')
                store.replaceReducer(nextReducer)
        )

    return store