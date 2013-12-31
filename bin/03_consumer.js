#!/usr/local/bin/node --use_strict --harmony
'use strict';

module.exports = consumer;

function* consumer() {
  let value;
  while (1) {
    value = yield null;
    console.log('Got value', value);
  }
}

let c = consumer();
c.next()
c.next('hello');
c.next('world');
