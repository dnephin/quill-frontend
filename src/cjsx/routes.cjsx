
Route = ReactRouter.Route
DefaultRoute = ReactRouter.DefaultRoute

# TODO: NotFoundRoute
routes =
  <Route handler={quill.app.App} path="/">
    <Route
        name="statement"
        path="/statement/:label"
        handler={quill.statement.StatementView} />
    <Route
        name="feedback"
        path="/feedback/:statement/:section"
        handler={quill.app.FeedbackView} />
    <DefaultRoute handler={quill.home.HomeView} />
  </Route>


ReactRouter.run routes, (Handler) ->
  React.render(<Handler/>, document.body)

