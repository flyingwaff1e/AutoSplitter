state("UNSIGHTED") { }

startup
{
	vars.timerModel = new TimerModel { CurrentState = timer };
	
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "UNSIGHTED";

    settings.Add("LabEscapeCutscene",        false,     "Laboratory");
    settings.SetToolTip("LabEscapeCutscene",            "Splits after exiting the laboratory");

    settings.Add("FinishedFirstPart",        false,     "Prologue");
    settings.SetToolTip("FinishedFirstPart",            "Splits after finishing the prologue");

    settings.Add("MeteorShard",              false,     "Shards");
    settings.SetToolTip("MeteorShard",                  "Splits after collecting a meteor shard");
    
    //Chips
    settings.Add("SplitChips",               false,     "Chips");
    settings.SetToolTip("SplitChips",                   "Splits after collecting a new chip");

    settings.Add("OffenseChip",              false,     "Agressive Chip",          "SplitChips");
    settings.Add("AnimaChip",                false,     "Anima Chip",              "SplitChips");
    settings.Add("AutoSyringeChip",          false,     "Auto Syringe Chip",       "SplitChips");
    settings.Add("AxeChip",                  false,     "Axe Chip",                "SplitChips");
    settings.Add("BigHeartChip",             false,     "Big Heart Chip",          "SplitChips");
    settings.Add("BulletChip",               false,     "Bullet Chip",             "SplitChips");
    settings.Add("CogChip",                  false,     "Cog Durability Chip",     "SplitChips");
    settings.Add("DefenseChip",              false,     "Defense Chip",            "SplitChips");
    settings.Add("DogChip",                  false,     "Dog Chip",                "SplitChips");
    settings.Add("DoubleBarrelChip",         false,     "Double Barrel Chip",      "SplitChips");
    settings.Add("DrifterChip",              false,     "Drifter Chip",            "SplitChips");
    settings.Add("ComboChipA",               false,     "Fast Combo Chip",         "SplitChips");
    settings.Add("FasterHealChip",           false,     "Faster Heal Chip",        "SplitChips");
    settings.Add("FatigueChip",              false,     "Fatigue Chip",            "SplitChips");
    settings.Add("GlitchChip",               false,     "Glitch Chip",             "SplitChips");
    settings.Add("BoltChip",                 false,     "Greed Chip",              "SplitChips");
    settings.Add("HealthChip",               false,     "Health Chip",             "SplitChips");
    settings.Add("InvincibilityChip",        false,     "Invincibility Chip",      "SplitChips");
    settings.Add("JumperChip",               false,     "Jumper Chip",             "SplitChips");
    settings.Add("ComboChipB",               false,     "Max Combo Chip",          "SplitChips");
    settings.Add("MerchantChip",             false,     "Merchant Chip",           "SplitChips");
    settings.Add("ParryMasterChip",          false,     "Parry Master Chip",       "SplitChips");
    settings.Add("PowerChip",                false,     "Power Chip",              "SplitChips");
    settings.Add("SpeedChipB",               false,     "Quick Attack Chip",       "SplitChips");
    settings.Add("ReloadChip",               false,     "Reload Chip",             "SplitChips");
    settings.Add("RiskChip",                 false,     "Risk Chip",               "SplitChips");
    settings.Add("RunnerChip",               false,     "Runner Chip",             "SplitChips");
    settings.Add("ScavengerChip",            false,     "Scavenger Chip",          "SplitChips");
    settings.Add("ShurikenChip",             false,     "Shuriken Chip",           "SplitChips");
    settings.Add("SpeedChipA",               false,     "Speed Chip",              "SplitChips");
    settings.Add("SpinChipA",                false,     "Spin Attack Chip",        "SplitChips");
    settings.Add("SpinChipB",                false,     "Spin Charge Chip",        "SplitChips");
    settings.Add("SpinnerChip",              false,     "Spinner Chip",            "SplitChips");
    settings.Add("StaminaChip",              false,     "Stamina Chip",            "SplitChips");
    settings.Add("SteadyChip",               false,     "Steady Chip",             "SplitChips");
    settings.Add("StrengthChip",             false,     "Strength Chip",           "SplitChips");
    settings.Add("SwordChip",                false,     "Sword Chip",              "SplitChips");
    settings.Add("SyringeChip",              false,     "Syringe Chip",            "SplitChips");
    settings.Add("VampireChip",              false,     "Vampire Chip",            "SplitChips");
    settings.Add("VirusChip",                false,     "Virus Chip",              "SplitChips");
    settings.Add("VigorChip",                false,     "Vitality Chip",           "SplitChips");
    settings.Add("WalletChip",               false,     "Wallet Chip",             "SplitChips");

    //Boss Rooms
    settings.Add("BossRooms",                false,     "Arenas");
    settings.SetToolTip("BossRooms",                    "Splits after entering a boss arena for the first time");

    settings.Add("CavesShrineBoss",          false,     "Asana",                   "BossRooms");
    settings.Add("AquariumBossRoom",         false,     "Maria",                   "BossRooms");
    settings.Add("MuseumBossRoom",           false,     "Luna",                    "BossRooms");
    settings.Add("FactoryBossRoom",          false,     "Nova",                    "BossRooms");
    settings.Add("SuburbsRailsBoss",         false,     "Sol",                     "BossRooms");
    settings.Add("DowntownSecretChurch",     false,     "M.",                      "BossRooms");
    settings.Add("FinalBossRoom",            false,     "Anima Nightmare",         "BossRooms");
    settings.Add("FinalBoss2Room",           false,     "Anima Essence",           "BossRooms");

    //Boss Kills
    settings.Add("BossKills",                false,     "Bosses");
    settings.SetToolTip("BossKills",                    "Splits after defeating a boss");

    settings.Add("RotatingSpiderDefeated",   false,     "Spinarach",               "BossKills");

    settings.Add("GardenMiniBossDefeated",   false,     "Knights",                 "BossKills");
    settings.Add("GardenBossDefeated",       false,     "Asana",                   "BossKills");

    settings.Add("AquariumCrab",             false,     "King Claudius",           "BossKills");
    settings.Add("AquariumBossDefeated",     false,     "Maria",                   "BossKills");

    settings.Add("MuseumBossDefeated",       false,     "Luna",                    "BossKills");
    settings.Add("FactoryBossDefeated",      false,     "Nova",                    "BossKills");
    settings.Add("AfterEagleBossCutscene",   false,     "Sol",                     "BossKills");
	settings.Add("GrimReaperDefeated",       false,	    "M.",				       "BossKills");
	settings.Add("ChurchCrab",               false,     "Tomb Guardian",	       "BossKills");

    //Mecha
    settings.Add("SplitMecha",               false,     "Mecha");
    settings.SetToolTip("SplitMecha",                   "Splits HAILEE states and upgrades");

    settings.Add("MechaActivated",           false,		"Activated",	           "SplitMecha");
    settings.Add("MechaDestroyed",           false,		"Destroyed",	           "SplitMecha");
    settings.Add("MechaArmsUpgrade",         false,		"Arms Upgrade",	           "SplitMecha");
    settings.Add("MechaCannonUpgrade",       false,		"Cannon Upgrade",	       "SplitMecha");

    //Special
    settings.Add("SplitSpecial",             false,     "Special");
    settings.SetToolTip("SplitSpecial",                 "Splits after collecting a special item");

    settings.Add("Spinner",                  false,     "Spinner",                 "SplitSpecial");
    settings.Add("KeyCard",                  false,     "Keycard",                 "SplitSpecial");
    settings.Add("JumpBootsBlueprint",       false,     "High-Jump Boots",         "SplitSpecial");
    settings.Add("FishingRod",               false,     "Magnetic Rod",            "SplitSpecial");
    settings.Add("GoldenRod",                false,     "Neodymium Rod",           "SplitSpecial");
    settings.Add("Shovel",                   false,     "Shovel",                  "SplitSpecial");

    //Weapons
    settings.Add("SplitWeapons",             false,     "Weapons");
    settings.SetToolTip("SplitWeapons",                 "Splits after collecting a new weapon");

    //Blades
    settings.Add("Blades",                   false,     "Blades",                  "SplitWeapons");
    
    settings.Add("IronEdge",                 false,     "Iron Edge",               "Blades");
	settings.Add("Frostbite",                false,     "Frostbite",               "Blades");
    settings.Add("Flameblade",               false,     "Flameblade",              "Blades");
	settings.Add("ThunderEdge",              false,     "Thunder Edge",            "Blades");
	settings.Add("ElementalBlade",           false,     "Elemental Blade",         "Blades");

	//Axes
    settings.Add("Axes",                     false,     "Axes",                    "SplitWeapons");

	settings.Add("WarAxe",                   false,     "War Axe",                 "Axes");
    settings.Add("IceAxe",                   false,     "Frost Axe",               "Axes");
    settings.Add("MeteorAxe",                false,     "Meteor Axe",              "Axes");
    settings.Add("ThunderAxe",               false,     "Thunder Axe",             "Axes");
    settings.Add("FireAxe",                  false,     "Blazing Axe",             "Axes");
    settings.Add("RaquelAxe",                false,     "Raquel's Axe",            "Axes");
    
    //Firearms
    settings.Add("Firearms",                 false,     "Firearms",                "SplitWeapons");

    settings.Add("Shotgun",                  false,     "Shotgun",                 "Firearms");
    settings.Add("Blaster",                  false,     "Blaster",                 "Firearms");
    settings.Add("AutomaticBlaster",         false,     "Auto. Blaster",           "Firearms");
    settings.Add("DoctorsGun",               false,     "Doctor's Pistol",         "Firearms");

    //Grenade Launchers
    settings.Add("Grenade Launchers",        false,     "Grenade Launchers",       "SplitWeapons");

    settings.Add("GranadeLauncher",          false,     "Grenade L.",              "Grenade Launchers");
    settings.Add("IceGranade",               false,     "Ice Grenade",             "Grenade Launchers");
	settings.Add("GranadeShotgun",           false,     "Grenade Spread",          "Grenade Launchers");

	//Throwers
    settings.Add("Throwers",                 false,     "Throwers",                "SplitWeapons");

	settings.Add("IceThrower",               false,     "Cryojet",                 "Throwers");
	settings.Add("Flamethrower",             false,     "Flamethrower",            "Throwers");
	
    //Shurikens
    settings.Add("Shurikens",                false,     "Shurikens",               "SplitWeapons");

	settings.Add("IronStar",                 false,     "Shuriken",                "Shurikens");
    settings.Add("IceStar",                  false,     "Ice Shuriken",            "Shurikens");
	settings.Add("FireStar",                 false,     "Fire Shuriken",           "Shurikens");
	settings.Add("ThunderStar",              false,     "Thunder Shuriken",        "Shurikens");

    //Hookshots
    settings.Add("Hookshots",                false,     "Hookshots",               "SplitWeapons");

    settings.Add("Hookshot1",                false,     "Hookshot",                "Hookshots");
    settings.Add("Hookshot2",                false,     "Double Hookshot",         "Hookshots");

    vars.playerDataSettings = new List<string>()
	{
        //Bosses
        "AfterEagleBossCutscene",
        "GardenMiniBossDefeated",
        "RotatingSpiderDefeated",
        "DefeatedDarkMonsters",
        "AquariumBossDefeated",
        "FactoryBossDefeated",
        "GardenBossDefeated",
		"MuseumBossDefeated",
        "GrimReaperDefeated",
        "AquariumCrab",
		"ChurchCrab",

        //Mecha
        "MechaActivated",
        "MechaDestroyed",
        "MechaArmsUpgrade",
        "MechaCannonUpgrade",

        //Prologue
        "LabEscapeCutscene",
        "FinishedFirstPart"
	};

    vars.roomList = new List<string>()
	{
        "CavesShrineBoss",
        "AquariumBossRoom",
        "MuseumBossRoom",
        "FactoryBossRoom",
        "SuburbsRailsBoss", 
        "DowntownSecretChurch",
        "FinalBossRoom",
        "FinalBoss2Room"
	};

    vars.itemList = new List<string>()
    {
        "KeyCard",
        "MeteorShard",
        "JumpBootsBlueprint",
        "FishingRod",
        "GoldenRod",
        "Shovel"
    };
}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono => {

        vars.Helper["loadedSlot"] = mono.Make<int>("GlobalGameData", 1, "_instance", "loadedSlot");
		
		vars.Helper["cutscene"] = mono.Make<bool>("CutsceneController", 1, "_instance", "cutscene");
		
		vars.UpdateData = (Func<dynamic, bool>)(data => {
		
			vars.Helper["dataStringsRaw"] = mono.MakeList<IntPtr>("GlobalGameData", 1, "_instance", "currentData", "playerDataSlots", 0x10, 0x20+(data*8), 0x78);
			current.dataStrings = new List<string>();

			vars.Helper["Rooms"] = mono.MakeList<IntPtr>("GlobalGameData", 1, "_instance", "currentData", "playerDataSlots", 0x10, 0x20+(data*8), 0x90);
			vars.RoomName = mono["VisitedRoomDescription"]["roomDescriptionName"];

			vars.Helper["Items"] = mono.MakeList<IntPtr>("GlobalGameData", 1, "_instance", "currentData", "playerDataSlots", 0x10, 0x20+(data*8), 0x38);
			vars.ItemName = mono["PlayerItemData"]["itemName"];
            vars.ItemQuanty = mono["PlayerItemData"]["quanty"];

            vars.Helper["Chips"] = mono.MakeList<IntPtr>("GlobalGameData", 1, "_instance", "currentData", "playerDataSlots", 0x10, 0x20+(data*8), 0x50);
			vars.ChipName = mono["PlayerChipData"]["chipName"];

			vars.Helper["Weapons"] = mono.MakeList<IntPtr>("GlobalGameData", 1, "_instance", "currentData", "playerDataSlots", 0x10, 0x20+(data*8), 0x28);
			vars.WeaponName = mono["EquipmentData"]["equipmentName"];

			vars.Helper["loading"] = mono.Make<bool>("GlobalSceneManager", "loading");
			
			return true;
		});
		
        return true;
    });
	
	vars.Hookshot = 0;
	vars.HookshotCheck = false;

    vars.MeteorShard = 0;
	vars.ShardsTotal = 0;
	
	vars.InitialLoad = false;
	vars.usedDataStrings = new List<String>();
}

update
{
	if ((timer.CurrentPhase == TimerPhase.Ended || timer.CurrentPhase == TimerPhase.NotRunning) && current.cutscene && !vars.InitialLoad) {
		vars.Helper.Update();
		vars.UpdateData(current.loadedSlot);
		vars.InitialLoad = true;
	}
}

split
{
	//Boss Kills / Mecha / Prologue
	if (old.dataStringsRaw.Count < current.dataStringsRaw.Count) {
		
		current.dataStrings = ((List<IntPtr>)current.dataStringsRaw).Select(address => {
			return vars.Helper.ReadString(100, ReadStringType.UTF16, address + 0x14);
		}).ToList();

        var i = current.dataStrings.Count - 1;
		var lastString = current.dataStrings[i];

		if (vars.playerDataSettings.Contains(lastString) && !vars.usedDataStrings.Contains(lastString) && current.dataStrings.Contains(lastString)) {

			vars.usedDataStrings.Add(lastString);
			return settings[lastString];
		}
	}
	
    //Rooms
    if (old.Rooms.Count < current.Rooms.Count) {

        var i = current.Rooms.Count - 1;
        var lastRoom = vars.Helper.ReadString(current.Rooms[i] + vars.RoomName);

        if (lastRoom == "CraterTowerExplosionCutscene")
            return true;

        if (vars.roomList.Contains(lastRoom))
            return settings[lastRoom];
    }

    //Items
    if (old.Items.Count < current.Items.Count) {

        var i = current.Items.Count - 1;
        var lastItem = vars.Helper.ReadString(current.Items[i] + vars.ItemName);
        
        if (lastItem == "MeteorShard") {
			vars.MeteorShard = current.Items[i];
            vars.ShardsTotal = 1;
		}

        if (vars.itemList.Contains(lastItem))
            return settings[lastItem];
    }

    //Chips
    if (old.Chips.Count < current.Chips.Count) {

        var i = current.Chips.Count - 1;
        var lastChip = vars.Helper.ReadString(current.Chips[i] + vars.ChipName);

        return settings[lastChip];
    }
    
    //Weapons
    if (old.Weapons.Count < current.Weapons.Count) {

        var i = current.Weapons.Count - 1;
        var lastWeapon = vars.Helper.ReadString(current.Weapons[i] + vars.WeaponName);
		
		if (lastWeapon == "Hookshot1") {
			vars.Hookshot = current.Weapons[i];
			vars.HookshotCheck = true;
		}

        return settings[lastWeapon];
    }

    //Shards
    if (vars.ShardsTotal != 0 && vars.Helper.Read<int>((IntPtr)vars.MeteorShard + vars.ItemQuanty) > vars.ShardsTotal) {
		vars.ShardsTotal += 1;
		return settings["MeteorShard"];
	}

    //Double Hookshot
	if (vars.HookshotCheck && vars.Helper.ReadString((IntPtr)vars.Hookshot + vars.WeaponName) == "Hookshot2") {
		vars.HookshotCheck = false;
		return settings["Hookshot2"];
	}
}

start
{
    return current.cutscene && current.Rooms.Count == 1;
}

isLoading
{
    return current.loading;
}