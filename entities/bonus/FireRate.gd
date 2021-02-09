extends Bonus

func _on_hit():
	#ICI CHANGER LE FIRE RATE DE L'ARME
	#CHANGER MEME L'ARME DU JOUEUR
	PlayerManager.x2_fire_rate()
	._on_hit()
