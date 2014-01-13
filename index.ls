# Refer to github:visionmedia/node-delegates for docs and tests
module.exports = class Delegator
	(@proto, @target) ~>
		@methods = []
		@getters = []
		@setters = []

	method: ->
		@methods.push it
		@proto[it] = @target~[name]
		@

	access: -> @getter it .setter it

	for let type, fun in {getter: (-> &0[&1] = &2), setter: -> &0[&1]}
		::[type] = ->
			@[type]push it
			@proto"__define#{ucfirst type}__" it, (,) -> fun @target, it, ...&

ucfirst = -> it.0.toUpperCase! + it.slice 1