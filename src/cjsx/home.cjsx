
Link = ReactRouter.Link

HomeView = React.createClass

  render: ->
    <div>
      <p>Home</p>
      <ul>
        <li><Link to="statement">statement</Link></li>
        <li><Link to="feedback">feedback</Link></li>
      </ul>
   </div>


window.quill.home =
    HomeView: HomeView
