extends Control


func _ready():
	if FileAccess.file_exists(ManagerGame.save_path):
		$VBoxContainer/Continue.disabled = false


func _on_new_game_pressed():
	ManagerGame.player_data = ManagerGame.get_data("res://reso/data/player_data.json")
	
	ManagerGame.save_game()
	
	LoadingScreen.load_scene("res://scenes/World.tscn")


func _on_continue_pressed():
	ManagerGame.player_data = ManagerGame.get_data(ManagerGame.save_path)
	
	LoadingScreen.load_scene("res://scenes/World.tscn")


func _on_quit_pressed():
	get_tree().quit()
