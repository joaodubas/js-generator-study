#!/usr/local/bin/node --use_strict --harmony
'use strict';

module.exports = naturalNumbers;

function *naturalNumbers() {
  var n = 1;
  while (true) {
    yield n;
    n += 1;
  }
}

for (let number of naturalNumbers()) {
  if (number > 10) break;
  console.log(number);
}

