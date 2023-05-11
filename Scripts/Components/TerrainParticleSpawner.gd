extends Node2D
class_name TerrainParticleSpawner

@export var terrain_detector: TerrainDetector

@export var spawn_location: Node2D
@export var terrain_map: Dictionary
@export var time_between_emissions: float

var current_turrain: Terrain.Type = Terrain.Type.GRASS

func _physics_process(_delta):
	spawn_particles()

func spawn_particles():
	var particle: GPUParticles2D = terrain_map[current_turrain].instantiate()
	var current_scene: Node = get_tree().get_current_scene()
	current_scene.add_child(particle)
	particle.global_position = spawn_location.global_position
	particle.emitting = true

func _on_terrain_detector_terrain_changed(new_terrain):
	current_turrain = new_terrain
