

StatementSectionInReview = React.createClass

  render: ->
    console.log @props
    section = @props.statement.getSection(@props.section)

    <div className="row statement section">
      <DocumentSection content={section} />
    </div>


DocumentSection = React.createClass

  render: ->
    section = @props.content
    <p data-section-id={section.id} key={section.id}>{section.body}</p>


FeedbackView = React.createClass
  mixins: [ ReactRouter.State ]

  componentDidMount: ->
    reqwest('/data/loomio.json').then (resp) =>
      @setState
        feedback: resp.feedback
        statement: new quill.stores.StatementModel(resp.statement[0])

  # TODO: use current/latest instead of [0]
  render: ->
    return false if not @state

    statement = @state.statement
    params = @getParams()

    <div>
      <StatementSectionInReview
        statement={statement}
        section={params.section}
        />
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


window.quill.view.feedback =
  FeedbackView: FeedbackView
