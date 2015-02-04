
Route = ReactRouter.Route
DefaultRoute = ReactRouter.DefaultRoute

# TODO: include version in the urls
# TODO: NotFoundRoute
routes =
  <Route handler={quill.view.app.App} path="/">
    <Route
        name="statement"
        path="/statement/:label"
        handler={quill.view.statement.StatementView} />
    <Route
        name="feedback"
        path="/feedback/:statement/:section"
        handler={quill.view.feedback.FeedbackView} />
    <DefaultRoute handler={quill.view.home.HomeView} />
  </Route>


router = ReactRouter.create
  routes: routes


router.run (Handler) ->
  React.render(<Handler/>, document.body)


util.namespace 'quill.view.router', (exports) ->
  exports.router = router
