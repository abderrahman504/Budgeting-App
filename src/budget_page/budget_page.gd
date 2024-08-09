extends Control


@onready var add_panel : Panel = $AddPanel
@onready var budget_label = $VBoxContainer/Budget/Label2
@onready var remain_label = $VBoxContainer/Remaining/Label2
@onready var spin_box = $AddPanel/HBoxContainer/SpinBox

@export_color_no_alpha var positive_remaining_value : Color
@export_color_no_alpha var negative_remaining_value : Color

var budget : int
var costs : PackedInt32Array

func _ready():
	update()

func update():
	budget_label.text = str(budget)
	var sum := 0
	for cost in costs:
		sum += cost
	var remaining := budget - sum
	remain_label.text = str(remaining)
	if(remaining > 0): remain_label.self_modulate = positive_remaining_value
	elif(remaining < 0): remain_label.self_modulate = negative_remaining_value
	else: remain_label.self_modulate = Color.WHITE

func _on_add_button_up():
	add_panel.show()


func _on_history_button_up():
	pass # Replace with function body.


func _on_add_panel_close_button_up():
	add_panel.hide()


func _on_add_panel_confirm_button_up():
	add_panel.hide()
	costs.append(spin_box.value)
	update()
	save_budget()


func _on_go_to_main_menu_button_up():
	save_budget()
	var vp = get_viewport()
	var mm = load("res://src/main_screen/main.tscn").instantiate()
	vp.remove_child(self)
	vp.add_child(mm)


func save_budget():
	pass

func load_budget(file_name: String):
	pass
