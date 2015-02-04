

# TODO: move to utils
buildObjectFromArray = (seq, func) ->
    obj = {}
    for item in seq
        continue if not item?
        obj[func(item)] = item
    obj


class StatementModel
    constructor: (@statement) ->
        @sections = buildObjectFromArray(
            @statement.problem.concat(@statement.summary, @statement.full),
            (section) -> section.id)

    getSection: (id) ->
      @sections[id]


# TODO: use namespace function
window.quill.stores = window.quill.stores || {}
quill.stores.StatementModel = StatementModel

util.namespace 'quill.stores', (exports) ->
  exports.StatementModel = StatementModel
