extends Control

func _on_ItemList_item_activated(index):
	print( $ItemList.get_item_tooltip(index) )
