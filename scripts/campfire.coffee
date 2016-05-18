module.exports = (robot) ->
  nouns = ['Mysterious beggar', 'Wily codger', 'Town Mayor', 'Strict school teacher', 'Reclusive witch', 'Circus strongman', 'Mustachioed pugilist', 'The butcher’s wife', 'Dubious fortune teller', 'Slacking farmhand', 'School bully', 'Bandit', 'One man band', 'Gloomy organ grinder', 'Evil looking magician', 'Unreliable vagrant', 'Old dog', 'Lone wolf', 'Pack of wolves', 'Cat wearing an apron', 'Black cat', 'Mountain lion', 'Overturned turtle', 'Brown bear', 'Raccoon with a knife', 'Escaped giraffe', 'Rampaging gorilla', 'Pig playing a jug', 'Blue bird', 'Barn owl', 'Spoopy raven', 'Crooked signpost', 'Wanted poster', 'Padlocked trunk', 'Gnarled oak', 'Scarecrow', 'Tiny tin soldier', 'Creepy doll', 'Gingerbread cottage', 'Abandoned cabin', 'Haunted manor', 'Lake', 'Foggy bog', 'Treasure map']

  verbs = ["stares kindly at you", "gazes mysteriously in your direction", "glares menacingly at you", "looks frantically around", "winks at you", "doesn’t seem to notice you at all", "listens with great interest to you", "turns an ear toward you", "doesn’t like what they are hearing from you", "has been eavesdropping on you", "sniffs at the pleasant air around you", "curiously turns its nose toward you", "doesn’t like the stench of your party", "scratches its nose indifferently", "turns its nose up at you", "recounts a hilarious joke", "tells you an intimate secret", "insults your appearance", "recounts a tasteless joke", "licks its lips hungrily", "asks what you’re looking at", "starts singing about your party as you pass", "calls your name", "plays a solemn tune about death or something", "flirts with you", "proposes a wager", "accuses you of a crime", "begins praying silently", "yawns at the sight of you", "accuses you of cheatin’", "begs for aid", "proposes a trade", "waves at you with familiarity", "walks hastily up beside you", "lunges at you from behind", "pushes a hoop down a road with a stick", "has been waiting for you", "has been following you for quite a while", "beckons you closer", "pushes past you in a hurry", "shoves you on the ground", "begins casting an elaborate spell", "boards up a window", "sounds the alarm", "skitters off at the sight of you", "scratches its back against a tree", "falls from the sky", "riddles you this", "seems awfully familiar", "brings news from the front lines", "whispers your name", "finally found you"]

  robot.hear /\%campfire start/i, (res) ->
    robot.brain.set 'gameState', 0
    robot.brain.set 'destination', singular nouns[Math.floor(Math.random() * nouns.length)]

    res.send 'Starting you a game of Campfire.\nYou are trying to reach *' + robot.brain.get('destination').toUpperCase().replace(/AN|A/, 'THE') + '*.'

  singular = (word) ->
    word = word.toLowerCase()
    vowels = ['a', 'e', 'i', 'o', 'u']
    if vowels.indexOf(word[0]) != -1
      "An #{word}"
    else
      "A #{word}"

  robot.hear /\%campfire prompt/i, (res) ->
    noun = nouns[Math.floor(Math.random() * nouns.length)]
    verb = verbs[Math.floor(Math.random() * verbs.length)]

    res.send "#{singular noun} #{verb}."
