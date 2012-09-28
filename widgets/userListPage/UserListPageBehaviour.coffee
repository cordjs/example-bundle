define [
  'cord!Behaviour'
  'cord!/cord/core/router/clientSideRouter'
], (Behaviour, router) ->

  class UserListPageBehaviour extends Behaviour

    events:
      'click .btn': 'onAddUserClick'

    onAddUserClick: (data) ->
      router.navigate '/example/pages/list/addUser/'
