import gtk
import minesweeper

class MainWin
	super GtkCallable

	var win: GtkWindow
 	var container : GtkGrid
	var buttons : Array[GtkButton]
	var game : Minesweeper

	
	var img_mine = "./img/24x24/mine.png"
	var img_blown_up = "./img/24x24/blown_up.png"
	var img_flag = "./img/24x24/flag.png"
	var img_questionmark = "./img/24x24/questionmark.png"

	redef fun signal ( sender, user_data ) 
	do
		if user_data isa Point then
			if not game.is_generated then 
				game.generate_game(user_data.x, user_data.y)
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

		# Create squares
 		for y in [0..row[  do
			for x in [0..column[ do
				var button = new GtkButton
				buttons.add button
				button.request_size (24, 24)
				button.on_click(self, new Point(x,y)) 
				container.attach(button, x, y, 1, 1)
			end
	 	end

		
		game = new Minesweeper(row,column,nbMines )
		win.show_all
	end

	fun discover (x: Int, y: Int, button: GtkButton)
	do
		var index = game.toIndex(x,y)
		print "##!! DISCOVER !!##"

		if game.game[index] != 9 then button.text="{game.game[index]}"
		if game.game[index] == 0 then
			var to_discover = game.play(x, y)
			for point in to_discover do
				index = game.toIndex(point.x,point.y)
				buttons[index].text="{game.game[index]}"
			end
		else if game.game[index] == 9 then
			var popup = new GtkDialog
# 			popup.title="B O O O O O O O M !"
# 			popup.run
			var mines = game.get_mines
			for mine in mines do 
				print "Mine ({mine.x},{mine.y})"
# 				container.attach(new GtkImage.file(img_blown_up), 10, 10, 1, 1)
				var widget = container.get_child_at(mine.x,mine.y)

				if widget isa GtkButton then 
					print "isa GtkButton"
					widget.add(new GtkImage.file(img_blown_up))
				end


# 				container.remove_widget(buttons[game.toIndex(mine.x,mine.y)])
				
			end
		end
	
	end
end


var window = new MainWin (20, 20,10	)
run_gtk
