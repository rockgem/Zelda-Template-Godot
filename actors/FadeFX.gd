extends CanvasLayer


signal fade_in
signal fade_out

@onready var mat = $Color.material

func fade(is_in = true):
	
	if is_in:
		var t = get_tree().create_tween()
		t.tween_property(mat, 'shader_parameter/progress', 1.0, 1.0)
		
		await t.finished
		
		fade_in.emit()
	else:
		var t = get_tree().create_tween()
		t.tween_property(mat, 'shader_parameter/progress', 0.0, 1.0)
		
		await t.finished
		
		fade_out.emit()
