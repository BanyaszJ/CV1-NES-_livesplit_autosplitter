
state("nestopia") // 1.51.1
{
	byte text : 0x0017901C, 0x4C, 0xA88, 0xA14, 0xA08, 0xBAC, 0x18;
}

state("Castlevania - Nestopia") // 1.51.1
{
	byte text : 0x0017901C, 0x4C, 0xA88, 0xA14, 0xA08, 0xBAC, 0x18;
}

startup
{
    settings.Add("Substages", false, "Also splits at stage transitions (in addition to orb pickups)");
}

init
{
	vars.allow_split = 1;
	
	if (settings["Substages"]){
		vars.skipSplit = new List<String>{"12", "8", "10"};
		print("=== SPLIT MODE: ALL SUBSTAGES MODE ===");
	}
	else{
		vars.skipSplit = new List<String>{"12"};
		print("=== SPLIT MODE: ONLY BOSSES MODE ===");
	}
}

update
{
	if (vars.skipSplit.Contains(old.text.ToString()) && current.text.ToString() == "5"){
		vars.allow_split = 1;
	}
}

start
{
	if (current.text.ToString() == "3" && old.text.ToString() == "1"){
		print(" === STARTING ===");
		vars.allow_split = 1;
		return true;
	}
	else{return false;}
}

split
{		
	if ((vars.skipSplit.Contains(current.text.ToString())) && old.text.ToString() == "5"){
		if (vars.allow_split == 1){
			print(" === SPLIT TRIGGER FOUND ===");
			vars.allow_split = 0;
			return true;
		}
		else{return false;}
	}
}

reset
{
	if (current.text.ToString() == "1"){
		print(" === RESET TRIGGER FOUND ===");
		vars.allow_split = 1;
		return true;
	}
	else{return false;}
}
