extends Control

var path = ''

var min_load_time = 2.0
var tick = 0.0

func _ready():
	hide()
	
	set_physics_process(false)


func _physics_process(delta):
	if path == '':
		return
	
	tick += delta
	
	if ResourceLoader.load_threaded_get_status(path) == ResourceLoader.THREAD_LOAD_LOADED and tick >= min_load_time:
		var res = ResourceLoader.load_threaded_get(path)
		get_tree().change_scene_to_packed(res)
		
		hide()
		
		set_physics_process(false)


func load_scene(path):
	get_tree().root.get_child(get_tree().root.get_child_count() - 1).queue_free()
	
	show()
	
	self.path = path
	
	ResourceLoader.load_threaded_request(path)
	
	set_physics_process(true)
