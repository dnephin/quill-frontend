
Link = ReactRouter.Link

HomeView = React.createClass

  render: ->
    <div>
      <p>Home</p>
      <ul>
        <li><Link
                to="statement"
                params={label: "political-use-for-loomio"}
            >
            statement
        </Link></li>
        <li><Link
                to="feedback"
                params={{
                    statement: "political-use-for-loomio"
                    section: "47fabbb1adb"
                }}
            >
            feedback
        </Link></li>
      </ul>
   </div>


window.quill.view.home =
    HomeView: HomeView
