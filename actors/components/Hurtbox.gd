extends Area2D


signal hurt
signal zero


var hp: int = 5



func hit(damage: int = 0):
	hp -= damage
	
	if hp <= 0:
		zero.emit()
	
	hurt.emit()


func _on_area_entered(area):
	hit()


func _on_body_entered(body):
	pass # Replace with function body.
