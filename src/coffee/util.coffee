#
#
#

namespace = (name, func) ->
  target = if exports? then exports else window
  target = target[item] or= {} for item in name.split '.'
  func(target)


namespace 'util', (exports) ->
  exports.namespace = namespace
