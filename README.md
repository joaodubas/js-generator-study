# JS GENERATORS

É interessante ver como a implementação de [`iterators`][e-h-iterators] e
[`generators`][e-h-generators] progrediu de uma implementação bastante similar
à do python, para algo bastante particular.

Em especial, o uso de [`generators`][e-h-generators] para evitar o
[_callback hell_][callback-hell]. Isso se deve ao fato de `yield` poder enviar
e receber dados simultaneamente.

```javascript
function* producerAndConsumer() {
  var counter = 0;
  var random = 0;
  while (true) {
    random = yield counter;
    counter += 1;
    console.log(random);
  }
}

var gen = producerAndConsumer();
gen.next()  // return {value: 1, done: false}
gen.next('ola')  // return {value: 2, done: false} e console.log('ola')
gen.next('mundo')  // return {value: 3, done: false} e console.log('mundo')

```

Assim como `generators` em python, é preciso inicializar o _loop_, por isso a
primeira chamada à `next` retorna um valor mas não evoca o `console#log`.

## Leitura adicional

* [Ecmascript Harmony][ecma-harmony]
    * [Ecmascript Harmony Propposals][e-h-proposal]
    * [Ecmascript Harmony Generators][e-h-generators]
* [What are generators][what-are-generators]
* [Callbacks vs coroutines][callbacks-vs-coroutines]

[ecma-harmony]: http://wiki.ecmascript.org/doku.php?id=harmony:harmony
[e-h-proposal]: http://wiki.ecmascript.org/doku.php?id=harmony:proposals
[e-h-generators]: http://wiki.ecmascript.org/doku.php?id=harmony:generators
[e-h-iterators]: http://wiki.ecmascript.org/doku.php?id=harmony:iterators
[what-are-generators]: http://tobyho.com/2013/06/16/what-are-generators/
[callbacks-vs-coroutines]: https://medium.com/code-adventures/174f1fe66127
[callback-hell]: http://callbackhell.com
