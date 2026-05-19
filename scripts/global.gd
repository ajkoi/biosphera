extends Node
var possessed_card = {
"grand_requin": [true, true], # remettre à false false
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
"homard": [false, false],
"elephant": [false, false],
"cheval": [false, false],
"grenouille": [false, false],
"tortue": [false, false],
"dauphin": [false, false],
"daurade": [false, false],
"poule": [false, false],
"pigeon": [true, false],
"espadon": [true, false],
"trex": [true, false],
"loup": [true, true],
"pieuvre": [false, true]
}
var zones = {
	"prairie" : ["poule", "coccinelle", "cheval", "grenouille"], # etc etc ... ... manger c'est bien UwU
	"riviere":["croco", "truite"],
	"mer":["grand_requin", "truite", "baleine", "crabe", "homard", "tortue", "dauphin", "daurade", "truite"],
	"foret_fonce":["boa", "chat", "coccinelle", "fourmi", "grenouille"],
	"marais":["boa", "croco"],
	"foret_claire":["poule", "chat", "coccinelle", "fourmi", "grenouille"],
	"caverne": ["chauve_souris"],
	"desert": ["kangourou"],
	"fossile": ["tigre", "archaeopteryx", "pteranodon", "ichtyosaure", "thylacine"],
}

var count_zone = {
	"prairie" : 0,
	"riviere":0,
	"mer":0,
	"foret_fonce":0,
	"marais":0,
	"foret_claire":0,
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
