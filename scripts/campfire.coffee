module.exports = (robot) ->
  nouns = ['signpost', 'old man', 'pumpkin', 'black cat', 'tiny tin soldier', 'cabin']
  verbs = ['glares at you', 'brings news from the front lines']

  robot.hear /\%campfire start/i, (res) ->
    robot.brain.set 'gameState', 0
    robot.brain.set 'destination', singular nouns[Math.floor(Math.random() * nouns.length)]

    res.send 'Starting you a game of Campfire.\nYou are trying to reach *' + robot.brain.get('destination').toUpperCase().replace(/AN|A/, 'THE') + '*.'

  singular = (word) ->
    vowels = ['a', 'e', 'i', 'o', 'u', 'h'] #sometimes h for this purpose
    if vowels.indexOf(word[0]) != -1
      "An #{word}"
    else
      "A #{word}"

  robot.hear /\%campfire prompt/i, (res) ->
    noun = nouns[Math.floor(Math.random() * nouns.length)]
    verb = verbs[Math.floor(Math.random() * verbs.length)]

    res.send "#{singular noun} #{verb}."

  robot.hear /\%campfire do/i, (res) ->
    res.send 'don\'t.'
