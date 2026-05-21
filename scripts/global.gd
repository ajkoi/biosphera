extends Node
var possessed_card = {
"grand_requin": [false, false],
"truite": [false, true],
"baleine": [false, true],
"boa": [false, true],
"croco": [false, true],
"chauve_souris": [false, true],
"chat": [false, true],
"coccinelle": [false, true],
"fourmi": [false, false],
"archaeopteryx": [false, false],
"mammouth": [false, false],
"tigre": [false, false],
"pteranodon": [false, false],
"ichtyosaure": [false, false],
"thylacine": [false, false],
"kangourou": [false, false],
"crabe": [false, false],
"homard": [true, false],
"elephant": [false, false],
"cheval": [false, false],
"grenouille": [false, false],
"tortue": [true, false],
"dauphin": [true, false],
"daurade": [false, false],
"poule": [false, false],
"pigeon": [true, false],
"espadon": [true, false],
"trex": [true, false],
"loup": [true, true],
"pieuvre": [false, false]
}
var zones = {
	"prairie" : ["poule", "coccinelle", "cheval", "grenouille"], # vert clair
	"riviere":["croco", "truite"], # bleu dans riviere 
	"mer":["grand_requin", "truite", "baleine", "crabe", "homard", "tortue", "dauphin", "daurade", "truite"], # bleu dans mer
	"marais":["boa", "croco"], # turquoise
	"foret":["poule", "chat", "coccinelle", "fourmi", "grenouille", "boa", "chat", "coccinelle", "fourmi", "grenouille"], # vert foncé
	"caverne": ["chauve_souris"],
	"desert": ["kangourou", "elephant"], # jaune
	"fossile": ["tigre", "archaeopteryx", "pteranodon", "ichtyosaure", "thylacine"],
	"neige": ["cheval", "chauve_souris"] # bleu clair
}

func revert_dic(dic: Dictionary):
	var cards_zones = {}
	for card in possessed_card.keys():
		cards_zones[card] = {}
	for key in dic.keys():
		for card in dic[key]:
			cards_zones[card][key] = null
	return cards_zones

@onready var card_zones = revert_dic(zones)

var count_zone = {
	"prairie" : 0,
	"riviere":0,
	"mer":0,
	"foret":0,
	"marais":0,
	"neige":0,
	"caverne": 0,
	"desert": 0,
	"fossile": 0,
}



var cards_pos = {}

var path_cours = {
	"cours_desert" :"res://cours/Desert_5/",
	"cours_marais" :"res://cours/Marais_4/",
	"cours_neige" :"res://cours/Neige_3/",
	"cours_foret" :"res://cours/Foret_2/",
	"cours_prairie": "res://cours/Prairie_debut_1/prairie/"
}
