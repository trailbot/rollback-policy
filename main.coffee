'use strict'
fs = require 'fs'

class Rollback
  constructor : (params) ->
    @path = params.path
    @type = params.type
    @allowRotate = params.allowRotate

  receiver : ({diff, prev}) =>
    # Check if change is addition, removal or mixed
    changeType = diff.reduce (acc, change) ->
      if change.type in ['add', 'rem']
        if acc
          if change.type isnt acc
            acc = 'mixed'
        else
          acc = change.type
      acc
    , null
    # Check if change is rotation
    isRotation = changeType is 'rem' and diff.length is 1

    # Only revert if change and rotation settings match
    if changeType is @type and (!isRotation or @allowRotate)
      console.log "Reverting change of type #{changeType}"
      fs.writeFile @path, prev.content, 'utf8'
    else
      console.log "Harmless change of type #{changeType}, ignoring"

module.exports = Rollback
