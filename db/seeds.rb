bodies = [
  ' Luigi _____ studente. Anche Marco _____ studente.',
  'ルイージは学生です。マルコも学生です。',
  'Luigi e Marco _____ italiani.',
  ' ルイージとマルコはイタリア人です。',
  '_____ italiano? − No, non _____ italiano. _____ _____.',
  '「あなたはイタリア人ですか？」「いいえ、私はイタリア人ではありません。日本人です。」',
  '_____ giapponesi? Sì, _____ giapponesi.',
  '「あなたたちは日本人ですか？」「はい、私たちは日本人です。」',
  '_____ _____? - _____ _____ Firenze.',
  '「どこに住んでいるの？」「フィレンツェに住んでいます。」【住む:abitare】',
  'Marco _____ _____ Venezia, ma _____ _____ Milano.',
  'マルコはヴェネツィア出身ですが、ミラノで働いています。',
  'Stasera _____ insieme!',
  '今晩、一緒に食事をしよう！',
  'Laura _____ _____ Milano. _____ musica.',
  'ラウラはミラノに住んでいます。音楽を勉強しています。【住む:abitare】',
  '_____ _____ Tokyo? No, _____ _____ _____ Tokyo.',
  '「東京に住んでいるの？」「いいえ、東京に住んでいません。」【住む:abitare】',
  '_____ _____ _____? - _____ _____ _____.',
  '「何を(2 語で)注文するの？」「コーヒーにする。」',
]

answers = [
  'è,è',
  'sono',
  'Sei,sono,Sono,giapponese',
  'Siete,siamo',
  'Dove,abiti,Abito,a',
  'è,di,lavora,a',
  'mangiamo',
  'abita,a,Studia',
  'Abiti,a,non,abito,a',
  'Che,cosa,prendi,Prendo,un,caffè'
]

10.times do |i|
  Question.create(body: bodies[2*i] + "\n" + bodies[2*i+1], answer: answers[i])
end
