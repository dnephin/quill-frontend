
Route = ReactRouter.Route
DefaultRoute = ReactRouter.DefaultRoute
Link = ReactRouter.Link

# TODO: NotFoundRoute
routes =
  <Route handler={App} path="/">
    <Route name="statement" handler={StatementView} />
    <Route name="feedback" handler={FeedbackView} />
    <DefaultRoute handler={Home} />
  </Route>


ReactRouter.run routes, (Handler) ->
  React.render(<Handler/>, document.body)

