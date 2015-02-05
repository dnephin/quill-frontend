#
#
#

namespace = (name, func) ->
  target = if exports? then exports else window
  target = target[item] or= {} for item in name.split '.'
  func(target)

#
# Immutable merge of two objects
#
merge = (objs...) ->
  merged = {}
  for obj in objs
    for key, value of obj
      merged[key] = value
  merged


namespace 'util', (exports) ->
  exports.namespace = namespace
  exports.merge = merge
