extends Control


func _ready():
	pass


func _on_new_game_pressed():
	ManagerGame.player_data = ManagerGame.get_data("res://reso/data/player_data.json")
	
	ManagerGame.save_game()
	
	LoadingScreen.load_scene("res://scenes/World.tscn")


func _on_continue_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
