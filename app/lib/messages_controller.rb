class MessagesController
	include Pakyouw::Helpers

	def create
		Message.new(request.params['message']).save
	end
end
