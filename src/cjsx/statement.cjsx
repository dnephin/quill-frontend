


Document = React.createClass

  render: ->
    return false if not @props.content

    <div className="col-md-12 document">{
      @props.content.map (section) ->
        <DocumentSection content={section} key={section.id} />
    }</div>


DocumentSection = React.createClass
  mixins: [ReactRouter.Navigation]

  getInitialState: ->
    # TODO: handle this so it doesn't have to be repeated
    style:
      cursor: "pointer"

  handleMouseOver: ->
    @setState
      style:
        background: "#C5E6D5"
        cursor: "pointer"

  handleMouseOut: ->
    @setState
      style:
        background: "transparent"
        cursor: "pointer"

  handleMouseClick: ->
    @transitionTo('feedback')

  render: ->
    return false if not @props.content

    section = @props.content
    <p  data-section-id={section.id}
        onMouseOver={@handleMouseOver}
        onMouseOut={@handleMouseOut}
        onClick={@handleMouseClick}
        className="document-section"
        style={@state.style}
    >
      {section.body}
    </p>


StatementAuthors = React.createClass

  # TODO: pull full author details for each id
  render: ->
    authors = this.props.authors

    <ul>{
      authors.map (author) ->
        <li key={author.id}>
          <p>{author.id}</p>
          <p>{author.credit}</p>
          <p>{author.relation}</p>
        </li>
    }</ul>


StatementVersion = React.createClass

  render: ->
    version = this.props.version
    semantic = version.semantic

    <div>
      <p><small>Version:</small> {semantic.join('.')}</p>
      <p><small>Published:</small> {version.publishedDate}</p>
      <p><small>Details:</small> {version.details}</p>
    </div>


StatementProblem = React.createClass

  render: ->
    document = this.props.document

    <div>
      <h2>Problem</h2>
      <Document content={document} />
    </div>


StatementSummary = React.createClass

  render: ->
    summary = this.props.document

    <div>
      <h2>Summary</h2>
      <Document content={summary} />
    </div>


StatementView = React.createClass

  # TODO: duplicated
  # TODO: use current/latest instead of [0]
  componentDidMount: ->
    reqwest('/data/loomio.json').then (resp) =>
      this.setState(resp.statement[0])

  render: ->
    statement = this.state
    return <div>loading statement...</div> if not statement

    <div>
      <h1>{statement.title}</h1>

      <div className="row">
        <div className="col-md-4">
          <StatementVersion version={statement.version} />
        </div>
        <div className="cold-md-8">
          <StatementAuthors authors={statement.authors} />
        </div>
      </div>
      <StatementProblem document={statement.problem} />
      <StatementSummary document={statement.summary} />
      <Document content={statement.full} />
    </div>


window.quill.statement =
    StatementView: StatementView
