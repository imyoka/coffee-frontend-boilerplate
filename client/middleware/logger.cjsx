module.exports= (store) => (next) => (action) =>
    console.log(action)
    return next(action)