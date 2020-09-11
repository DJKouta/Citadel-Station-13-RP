SUBSYSTEM_DEF(nanoui)
	name = "NanoUI"
	wait = 7
	// a list of current open /nanoui UIs, grouped by src_object and ui_key
	var/list/open_uis = list()
	// a list of current open /nanoui UIs, not grouped, for use in processing
	var/list/processing_uis = list()
	// a list of asset filenames which are to be sent to the client on user logon
	var/list/asset_files = list()

/datum/controller/subsystem/nanoui/Initialize() //this is so fucking bad
	var/list/nano_assetDirs = list(
		"nano/css/",
		"nano/images/",
		"nano/images/status_icons/",
		"nano/images/modular_computers/",
		"nano/js/",
		"nano/templates/"
	)

	var/list/filenames = null
	for (var/path in nano_assetDirs)
		filenames = flist(path)
		for(var/filename in filenames)
			if(copytext(filename, length(filename)) == "/") // filenames which end in "/" are actually directories, which we want to ignore
				continue
			if(fexists(path + filename) && !SSassets.cache[filename])
				asset_files |= SSassets.transport.register_asset(filename, path + filename)
	. = ..()
	for(var/i in GLOB.clients)
		SSassets.transport.send_assets(i, asset_files)

/datum/controller/subsystem/nanoui/Recover()
	if(SSnanoui.open_uis)
		open_uis |= SSnanoui.open_uis
	if(SSnanoui.processing_uis)
		processing_uis |= SSnanoui.processing_uis
	if(SSnanoui.asset_files)
		asset_files |= SSnanoui.asset_files

/datum/controller/subsystem/nanoui/stat_entry()
	return ..("[processing_uis.len] UIs")

/datum/controller/subsystem/nanoui/fire(resumed)
	for(var/thing in processing_uis)
		var/datum/nanoui/UI = thing
		UI.process()

