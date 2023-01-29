fx_version 'cerulean'
game 'gta5'
use_fxv2_oal 'yes'
lua54        'yes'
version '0.1'

description 'Garage script by TechJess'

ui_page 'html/form.html'

files {
	'html/form.html',
	'html/css.css',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
}

dependencies {
	'es_extended',
	'PolyZone'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fi.lua',	
	'locales/fr.lua',
	'locales/es.lua',
	'config.lua',
	'client/zones.lua',
	'server/main.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fi.lua',	
	'locales/fr.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua',
	'client/zones.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
}

exports {
    'opengaragemenu'
}

shared_scripts {
    '@ox_lib/init.lua'
}
