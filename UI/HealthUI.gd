extends Control


var health


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerStats.connect("health_changed", self, "set_health")
	pass # Replace with function body.
	
func set_health(value):
	$Label.text = str(value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
