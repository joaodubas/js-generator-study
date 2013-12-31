#!/usr/local/bin/node --use_strict --harmony
'use strict';

module.exports = consumer;

function* consumer() {
  let value;
  while (1) {
    try {
      value = yield null;
      console.log('Got value', value);
    } catch (e) {
      console.log('You throw error', e);
      console.log('But I caught.');
    }
  }
}

let c = consumer();
c.next()
c.next('hello');
c.next('world');
c.throw(new Error('Throwing up'));
