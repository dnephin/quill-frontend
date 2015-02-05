
Link = ReactRouter.Link

HomeView = React.createClass

  render: ->
    <div>
      <p>Home</p>
      <ul>
        <li><Link to="/statement/political-use-for-loomio/latest">
          statement
        </Link></li>
        <li><Link to="/statement/political-use-for-loomio/latest/section/47fabbb1adb">
          statement section overview 
        </Link></li>
      </ul>
   </div>


util.namespace 'quill.view.home', (exports) ->
  exports.HomeView = HomeView
