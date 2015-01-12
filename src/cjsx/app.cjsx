

StatementSectionUnderReview = React.createClass

  render: ->
    <div className="row statement section">
      <Document content={this.props.statement.full} />
    </div>


Document = React.createClass

  render: ->
    sections = this.props.content.map (section) ->
      <p data-section-id={section.id} key={section.id}>{section.body}</p>

    <div className="col-md-12 document" >{sections}</div>


FeedbackViewRoute = React.createClass

  # TODO: display an empty page instead of initial empty statement
  getInitialState: ->
    statement: [
      full: []
    ]

  componentDidMount: ->
    reqwest('/data/loomio.json').then (resp) =>
      console.log(resp)
      this.setState(resp)

  # TODO: use current/latest instead of [0]
  render: ->
      <div>
      <StatementSectionUnderReview statement={this.state.statement[0]}/>
      <div className="row">
        <div className="col-md-12 summary">
          Summarized feedback parents
        </div>
      </div>

      <div className="row focus-parent">
        <div className="col-md-1 author">
          Author
        </div>
        <div className="col-md-9">
          Parent comment
        </div>
        <div className="col-md-2">
          Parent summary
        </div>
      </div>

      <div className="row focus-comment">
        <div className="col-md-1 author">
            Author
        </div>
        <div className="col-md-11">
          Focus comment

          <div className="reply">
          Reply here
          </div>
        </div>
      </div>

      <div className="row focus-children">
        <div className="col-md-9">
          <div className="row">
            <div className="col-md-12 summary">
              Child list details
            </div>
          </div>

          <div className="row focus-children">
            <div className="col-md-1 author author-mini">
              Author
            </div>
            <div className="col-md-10">
              Child comment
            </div>
            <div className="col-md-1">
              mini summary
            </div>
          </div>
        </div>

        <div className="col-md-3 focus-summary">
          Focus summary
        </div>
      </div>
      </div>


App = React.createClass
  render: ->
    <div className="App">
      <nav className="navbar navbar-default navbar-fixed-top" role="navigation">
        <div className="container">
          <div className="navbar-header">
            <a className="navbar-brand" href="#">Quill</a>
          </div>
        </div>
      </nav>

      <div className="container">
        <ReactRouter.RouteHandler />
      </div>
    </div>


Route = ReactRouter.Route
DefaultRoute = ReactRouter.DefaultRoute

# TODO: NotFoundRoute
routes =
  <Route handler={App} path="/">
    <DefaultRoute handler={FeedbackViewRoute} />
  </Route>


ReactRouter.run routes, (Handler) ->
  React.render(<Handler/>, document.body)

# vi:syntax=coffee
