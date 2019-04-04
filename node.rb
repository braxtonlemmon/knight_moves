class Node
	attr_accessor :address, :parent, :children

	def initialize(address, parent=nil)
		@address = address
		@parent = parent
		@children = Array.new
	end
end
