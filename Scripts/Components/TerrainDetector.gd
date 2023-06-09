extends Area2D
class_name TerrainDetector

var current_terrain: Terrain.Type = Terrain.Type.GRASS
var is_on_water: bool = false
signal terrain_changed(new_terrain: Terrain.Type)

# Called when the node enters the scene tree for the first time.
func _ready():
	body_shape_entered.connect(_on_body_shape_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func process_tilemap(body: TileMap, body_rid: RID):
	var tile_coords: Vector2 = body.get_coords_for_body_rid(body_rid)
	var tile_data: TileData
	var layer_count: int = body.get_layers_count()
	if layer_count >= 5:
		is_on_water = body.get_cell_tile_data(5, tile_coords) != null
	for i in layer_count:
		tile_data = body.get_cell_tile_data(i, tile_coords)
		if tile_data:
			break;
		
	var new_terrain: Terrain.Type = tile_data.get_custom_data("terrain_type")
	if new_terrain and new_terrain != current_terrain:
		current_terrain = new_terrain
		terrain_changed.emit(new_terrain)

func _on_body_shape_entered(body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int):
	if body is TileMap:
		process_tilemap(body, body_rid)
		
