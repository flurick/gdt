tool
extends CollisionShape2D

func _ready():
	shape.connect("changed", self, "align_rect")

func align_rect():
	print("changed")
	transform.x += Vector2(10,0)