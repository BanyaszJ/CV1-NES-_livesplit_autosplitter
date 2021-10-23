
state("nestopia")
{
	byte text : 0x0017901C, 0x4C, 0xA88, 0xA14, 0xA08, 0xBAC, 0x18;
}

state("Castlevania - Nestopia")
{
	byte text : 0x0017901C, 0x4C, 0xA88, 0xA14, 0xA08, 0xBAC, 0x18;
}

init
{
	vars.allow_split = 1;
	print(current.text.ToString());
}

update
{
	if (current.text.ToString() == "5" && old.text.ToString() == "12"){
		vars.allow_split = 1;
	}
}

start
{
	if (current.text.ToString() == "3" && old.text.ToString() == "1"){
		print(" === RUNNING START");
		vars.allow_split = 1;
		return true;
	}
	else{return false;}
}

split
{
	if (current.text == 12 && old.text == 5){
		if (vars.allow_split == 1){
			print(" === RUNNING SPLIT	");
			vars.allow_split = 0;
			return true;
		}
		else{return false;}
	}
}

reset
{
	if (current.text.ToString() == "1"){
		print(" === RUNNING RESET");
		vars.allow_split = 1;
		return true;
	}
	else{return false;}
}
