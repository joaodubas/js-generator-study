#!/usr/local/bin/node --use_strict --harmony
'use strict';

module.exports = haiku;

function* haiku() {
  let messages = [
    'I kill an ant',
    'and realize my three children',
    'have been watching.',
    '-Kato Shuson'
  ];
  for (let index in messages) {
    console.log(messages[index]);
    yield null;
  }
}

let g = haiku();
function next() {
  if (g.next().done) return;
  setTimeout(next, 1000);
}
next();
