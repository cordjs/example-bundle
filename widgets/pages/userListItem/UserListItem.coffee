define [
  'cord!Widget'
], (Widget) ->

  class UserListItem extends Widget
    behaviourClass: false

    @initialCtx:
      name: ''
      age: 0

    @params:
      name: ':ctx'
      age: ':ctx'
