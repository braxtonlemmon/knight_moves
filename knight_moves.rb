#!/home/braxton/.rbenv/shims/ruby

# TODO: Fix bug. When running knight_moves([1,4],[1,3]) knight repeats two moves, resulting in 5 moves, when the answer is 3 moves.
#       Track the path the piece takes and don't allow repeats
require_relative 'node'

class Knight 
	attr_reader :board
	attr_accessor :path

	def initialize
		@board = make_board
		@path = Array.new
	end

	def make_board
		board = Array.new(8) { Array.new(8) { Array.new(2) } }
	  board.each_with_index do |row, row_i|
			row.each_with_index { |column, column_i| column[0], column[1] = row_i, column_i }
		end
	end

	def build_children(root)
		moves = [[-2,-1], [-2,1], [-1,-2], [-1,2], [1,-2], [1,2], [2,-1], [2,1]]
		possible_moves = moves.select { |move| check_move(move, root.address) }
		root.children = possible_moves.map { |move| Node.new([(move[0]+root.address[0]), (move[1]+root.address[1])], root) }
	end
		
	def check_move(move, current)
		result = [(move[0] + current[0]), (move[1] + current[1])]
		result[0].between?(0,7) && result[1].between?(0,7) ? true : false
	end

	def build_level(queue)
		new_queue = Array.new
		until queue.empty?
		  move = queue.shift
		  new_queue += build_children(move)
		end
		new_queue
	end

	def completion(move, level)
		puts "You reached your spot in #{level} moves! Here is your path:"
		p move.address
		path = move
		until path.parent.nil?
			p path.parent.address
			path = path.parent
		end
	end
end

def knight_moves(root, goal)
	return puts "You are already there!" if root == goal
	knight = Knight.new
	return puts "Invalid!" unless root[0].between?(0,7) && root[1].between?(0,7) && goal[0].between?(0,7) && goal[1].between?(0,7)
	
	queue = knight.build_children(Node.new(root))
	level = 1
	while true
		queue2 = Array.new
		queue.each { |child| (child.address == goal) ? (return knight.completion(child, level)) : (queue2 << queue.shift) }
		queue = knight.build_level(queue2)
		level += 1
	end
end

knight_moves([3,3], [4,3])
knight_moves([9,0],[1,1])
knight_moves([5,3], [2,2])
knight_moves([1,4], [1,3])


