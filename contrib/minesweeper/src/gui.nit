import gtk
import minesweeper

class MainWin
	super GtkCallable

	var win: GtkWindow
 	var container : GtkGrid
	var buttons : Array[GtkButton]
	var game : Minesweeper
	
	var img_dir = "../img/32x32/"
	var img_mine = "mine.png"
	var img_blown_up = "blown_up.png"
	var img_flag = "flag.png"
	var img_questionmark = "questionmark.png"
	var img_nbmines: Array[String] = [ "tile_zero.png", "tile_one.png", "tile_two.png", "tile_three.png", "tile_four.png", "tile_five.png", "tile_six.png", "tile_seven.png", "tile_eight" ]

	redef fun signal ( sender, user_data ) 
	do
		if user_data isa Point then
			if not game.is_generated then 
			end
			self.discover(user_data.x, user_data.y, buttons[game.toIndex(user_data.x,user_data.y)])
		end
	end

	init (row: Int, column: Int, nbMines: Int)
	do
		init_gtk
		win = new GtkWindow( 0 )
		win.title="Mine Sweeper"
		container = new GtkGrid(row,column,true)
		win.add ( container ) 
		
		buttons = new Array[GtkButton]

		game = new Minesweeper(row,column,nbMines )
		game.generate_game(10, 10)

		# Create squares
 		for y in [0..row[  do
			for x in [0..column[ do
				var button = new GtkButton
				buttons.add button
				button.request_size (24, 24)
				button.on_click(self, new Point(x,y)) 
				container.attach(button, x, y, 1, 1)
				container.attach(image(game.game[game.toIndex(x, y)]), x, y, 1, 1)
			end
	 	end
		
		win.show_all
	end

	fun discover (x: Int, y: Int, button: GtkButton)
	do
		var index = game.toIndex(x,y)
		print "##!! DISCOVER !!##"
		container.remove_widget(buttons[game.toIndex(x, y)])

		if game.game[index] == 0 then
			var to_discover = game.play(x, y)

			for point in to_discover do
				index = game.toIndex(point.x,point.y)
				container.remove_widget(buttons[index])
			end
		else if game.game[index] == 9 then
			var popup = new GtkDialog
			var mines = game.get_mines

			for mine in mines do 
				var widget = container.get_child_at(mine.x,mine.y)

				if widget isa GtkButton then 
					print "isa GtkButton"
					widget.add(new GtkImage.file(img_blown_up))
				end

				container.remove_widget(buttons[game.toIndex(mine.x,mine.y)])
			end
		end
	end

	fun image(tile: Int): GtkImage
	do
		if tile >= 0 and tile <= 8 then
			return new GtkImage.file(img_dir + img_nbmines[tile])
		else 
			return new GtkImage.file(img_dir + img_blown_up)
		end

	end
end

var window = new MainWin (20, 20, 25)
run_gtk
