extends Control



func _on_new_budget_button_up():
	$NewBudgetPanel.show()


func _on_close_new_budget_button_up():
	$NewBudgetPanel.hide()


func _on_confirm_new_budget_button_up():
	var budget : int = $NewBudgetPanel/SpinBox.value
	$NewBudgetPanel.hide()
	
	var budget_page: Control = load("res://src/budget_page/budget_page.tscn").instantiate()
	budget_page.budget = budget
	var vp = get_viewport()
	vp.remove_child(self)
	vp.add_child(budget_page)
	

