var OptsMixin = {
  init: function(opts) {
    this.on('updated', function() { console.log('Updated!') })
  },

  getOpts: function() {
    return this.opts
  },

  setOpts: function(opts, update) {
    this.opts = opts
    if (!update) this.update()
    return this
  }
}

<my-tag>
  <h1>{ opts.title }</h1>
  this.mixin(OptsMixin)
</my-tag>

/* can also be used globally */
riot.mixin(OptsMixin);
