extends Area2D


signal hurt
signal zero


var hp: int = -1



func take_damage(damage: int = 0):
	Sfx.play_sound('Hit')
	
	var df = load("res://actors/DamageFloater.tscn").instantiate()
	df.get_node('Label').text = str(damage)
	add_child(df)
	
	hp -= damage
	
	if hp <= 0:
		zero.emit()
	
	hurt.emit()


func _on_area_entered(area):
	pass


func _on_body_entered(body):
	pass # Replace with function body.
