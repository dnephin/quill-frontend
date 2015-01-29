


Document = React.createClass

  render: ->
    return false if not @props.content

    sections = this.props.content.map (section) ->
      <p data-section-id={section.id} key={section.id}>{section.body}</p>

    <div className="col-md-12 document">{sections}</div>


StatementAuthors = React.createClass

  # TODO: pull full author details for each id
  render: ->
    authors = this.props.authors

    <ul>
    { authors.map (author) ->
      <li>
          <p>{author.id}</p>
          <p>{author.credit}</p>
          <p>{author.relation}</p>
      </li>
    }
    </ul>


StatementVersion = React.createClass

  render: ->
    version = this.props.version
    semantic = version.semantic

    <div>
      <p><small>Version:</small> {semantic.join('.')}</p>
      <p><small>Published:</small> {version['published-date']}</p>
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
