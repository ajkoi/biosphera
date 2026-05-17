extends Node
var possessed_card = {
"grand_requin": [true, false], # remettre à false false
"truite": [false, false],
"baleine": [false, false],
"boa": [false, false],
"croco": [false, false],
"chauve_souris": [false, false],
"chat": [false, false],
"coccinelle": [false, false],
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
"loup": [true, false],
"pieuvre": [false, false]
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

var cards_pos = {}

var path_cours = {
	"cours_desert" :"res://cours/Desert_5/",
	"cours_marais" :"res://cours/Marais_4/",
	"cours_feige" :"res://cours/Neige_3/",
	"cours_foret" :"res://cours/Foret_2/",
	"cours_prairie": "res://cours/Prairie_debut_1/prairie/"
}
