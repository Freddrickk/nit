#
# Author : Frédéric Vachon
# 

import pipeline

class Minesweeper
	var mine_flag =  9 # Mine representation 
	var nbMines : Int
	var mines: Array[Point]
	var game: Array[Int]
	var pressed_squares: Array[Bool]
	var width : Int
	var generated = false
	
	init ( row : Int, column : Int, nbMines : Int )
	do
		self.nbMines = nbMines
		self.width = row
		mines = new Array[Point].with_capacity(nbMines)
		game = new Array[Int].with_capacity(row*column)
		pressed_squares = new Array[Bool].with_capacity(row*column)
		for i in [0..row*column[ do
			game.push(0)
			pressed_squares.push(false)
		end
	end

	fun play ( x: Int, y: Int ): Array[Point]
	do
		var points = new Array[Point]
		pressed_squares[toIndex(x,y)] = true
		points = adjacent_free_squares(x,y,points)
		return points
	end

	fun get_mines : Array[Point] do return mines

	fun generate_game ( x_pressed: Int, y_pressed: Int )
	do
		var added_mines = 0
		generated = true
		# Add mines
		loop
			if added_mines == nbMines then break
			var x = width.rand
			var y = width.rand
			print "point random = ({x},{y})"
			if x != x_pressed and y != y_pressed then
				if game[toIndex(x,y)] != mine_flag  then 
					game[toIndex(x,y)] = mine_flag
					mines.push(new Point(x,y))
					added_mines += 1
				end
			end
		end
		
		# Add numbers
 		for y in [0..width[  do
			for x in [0..width[ do
				if game[toIndex(x,y)] == mine_flag then continue
				game[toIndex(x,y)] = adjacent_mines(x,y)
			end
	 	end
	end

	fun is_generated : Bool do return generated
	
	fun adjacent_free_squares(x: Int, y: Int, free_squares: Array[Point]): Array[Point]
	do
		 
		# Check left square
		if is_within_bounds(x-1,y) then
			var p = new Point(x-1,y)
			if not pressed_squares[toIndex(x-1,y)] then
				pressed_squares[toIndex(x-1,y)] = true
				if  game[toIndex(x-1,y)] == 0  then
					free_squares.push(p)
					adjacent_free_squares(x-1,y,free_squares)
				else 
					free_squares.push(p)
				end
			end
		end

		# Check right square
		if is_within_bounds(x+1,y) then
			var p = new Point(x+1, y)
			if not pressed_squares[toIndex(x+1,y)] then
				pressed_squares[toIndex(x+1,y)] = true
				if  game[toIndex(x+1,y)] == 0  then
					free_squares.push(p)
					adjacent_free_squares(x+1,y,free_squares)
				else 
					free_squares.push(p)
				end
			end
		end

		# Check down square
		if is_within_bounds(x,y+1) then
			var p = new Point(x,y+1)
			if not pressed_squares[toIndex(x,y+1)] then
				pressed_squares[toIndex(x,y+1)] = true
				if  game[toIndex(x,y+1)] == 0  then
					free_squares.push(p)
					adjacent_free_squares(x,y+1,free_squares)
				else 
					free_squares.push(p)
				end
			end
		end

		# Check up square
		if is_within_bounds(x,y-1) then
			var p = new Point(x,y-1)
			if not pressed_squares[toIndex(x,y-1)] then
				pressed_squares[toIndex(x,y-1)] = true
				if  game[toIndex(x,y-1)] == 0  then
					free_squares.push(p)
					adjacent_free_squares(x,y-1,free_squares)
				else 
					free_squares.push(p)
				end
			end
		end

 		return free_squares
 	end
 
	fun adjacent_mines( square_x: Int, square_y: Int ): Int
	do
		var nbMines = 0
		for c1 in [-1, 0, 1] do
			for c2 in [-1, 0, 1] do
				if c1 == 0 and c2 == 0 then continue
				if is_within_bounds(square_x+c1, square_y+c2) then
					if game[toIndex(square_x + c1,square_y + c2)] == mine_flag then nbMines+=1
				end
			end
		end
		return nbMines
	end

	fun is_within_bounds(x: Int, y: Int) : Bool
	do 
		return x >= 0 and x < width and y >= 0 and y < width
	end

	fun toIndex ( x: Int, y: Int): Int
	do
		return (y * width) + x 
	end
end

class Point
	var x: Int
	var y: Int

	redef fun ==(i: nullable Object) : Bool 
	do 
		if i isa Point then return x == i.x and y == i.y
		return false
	end

end 
