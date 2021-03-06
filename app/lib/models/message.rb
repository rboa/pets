class Message

  # Public attributes that the messages will have

  attr_accessor :id, :author, :body

  # In memory messagess storage. They will be 
  # destroyed if the server stops.

  @@messages = []

  # Keeps track of the latest id that has been
  # used

  @@latest_id = 0

  # Initialize the Message attributes given a 
  # hash of :attribute_name => :attribute_value 

  def initialize(params={})
  	#puts "params is #{params.class}"
  	#if !params.nil?
	    params.each do |key, value|
	      self.send("#{key}=", value)
	    end
	#end
  end

  # Sets the message id and adds it to the 
  # messages storege.

  def save
    @@latest_id += 1
    self.id = @@latest_id
    @@messages << self
  end

  def self.all
  	@@messages
  end

  def self.find(id)
    @@messages.find { |message| message.id == id }
  end

  def update(params={})
    params.each do |key, value|
      self.send("#{key}=", value)
    end
  end

end