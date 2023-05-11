extends Node2D
class_name TerrainParticleSpawner

@onready var terrain_detector: TerrainDetector = $TerrainDetector

@export var spawn_location: Node2D
@export var terrain_map: Dictionary
@export var time_between_emissions: float

var current_turrain: Terrain.Type = 1

func _readY():
	terrain_detector.terrain_changed.connect(_on_terrain_changed)

func _physics_process(delta):
	var particle: GPUParticles2D = terrain_map[current_turrain].instantiate()
	var current_scene: Node = get_tree().get_current_scene()
	current_scene.add_child(particle)
	particle.global_position = spawn_location.global_position
	particle.emitting = true


func _on_terrain_changed(new_turrain: Terrain.Type):
	current_turrain = new_turrain
