

var StatementSectionUnderReview = React.createClass({

  render: function() {
    console.log(this.props)
    return (
      <div className="row statement section">
        <div className="col-md-12">
           <p>{this.props.statement}</p>
        </div>
      </div>
    );
  }
});


var FeedbackViewRoute = React.createClass({

  getInitialState: function() {
    return {};
  },

  componentDidMount: function() {
    reqwest('/data/loomio.json').then(function (resp) {
      console.log(resp);
      this.setState(resp);
    }.bind(this));
  },

  render: function() {
    return (
      <div>
      <StatementSectionUnderReview statement={this.state.statement}/>
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
    );
  }
});


// TODO: router
React.render(
  <FeedbackViewRoute />,
  document.getElementById('content')
)
