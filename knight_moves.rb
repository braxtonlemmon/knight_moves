#!/home/braxton/.rbenv/shims/ruby

require_relative 'node'

class Knight 
	attr_reader :board
	attr_accessor :path

	def initialize
		@board = make_board
		@path = Array.new
	end

	def build_children(root)
		moves = [[-2,-1], [-2,1], [-1,-2], [-1,2], [1,-2], [1,2], [2,-1], [2,1]]
		possible_moves = moves.select { |move| check_move(move, root.address) }
		root.children = possible_moves.map { |move| Node.new([(move[0]+root.address[0]), (move[1]+root.address[1])], root) }
	end

	def completion(move)
		puts "You reached your spot in #{pathway(move).size} moves! Here is your path:"
		path.reverse.each { |move| p move }
		p move.address
	end

	private

	def make_board
		board = Array.new(8) { Array.new(8) { Array.new(2) } }
	  board.each_with_index do |row, row_i|
			row.each_with_index { |column, column_i| column[0], column[1] = row_i, column_i }
		end
	end
	
	def check_move(move, current)
		result = [(move[0] + current[0]), (move[1] + current[1])]
		result[0].between?(0,7) && result[1].between?(0,7) ? true : false
	end

	def pathway(node)
		until node.parent.nil?
			@path << node.parent.address
			node = node.parent
		end
		path
	end
end

def knight_moves(root, goal)
	return puts "You are already there!" if root == goal
	knight = Knight.new
	return puts "Invalid!" unless root[0].between?(0,7) && root[1].between?(0,7) && goal[0].between?(0,7) && goal[1].between?(0,7)
	queue = knight.build_children(Node.new(root))
	while true
		node = queue.shift
		return knight.completion(node) if node.address == goal
		queue += knight.build_children(node)
	end
end

knight_moves([0,0], [7,6])
knight_moves([0,1], [0,1])
knight_moves([8,9], [1,2])
knight_moves([0,0], [3,4])




