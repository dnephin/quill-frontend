

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


window.quill =
  app:
    App: App

# vi:syntax=coffee
