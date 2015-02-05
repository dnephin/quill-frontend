
Route = ReactRouter.Route
DefaultRoute = ReactRouter.DefaultRoute
Redirect = ReactRouter.Redirect

# TODO: include version in the urls
# TODO: NotFoundRoute
routes =
  <Route handler={quill.view.app.App} path="/">
    <Route
        name="statement"
        path="/statement/:label/:version"
        handler={quill.view.statement.StatementView} />
    <Route
        name="statement-section-overview"
        path="/statement/:label/:version/section/:section"
        handler={quill.view.statement.SectionOverview} />
    <Route
        name="feedback"
        path="/feedback/:statement/:version/:feedback"
        />
    <DefaultRoute handler={quill.view.home.HomeView} />
  </Route>


router = ReactRouter.create
  routes: routes


router.run (Handler) ->
  React.render(<Handler/>, document.body)


util.namespace 'quill.view.router', (exports) ->
  exports.router = router
