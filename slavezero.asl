state("d3d_SlaveZero")
{
    string5 level:           "d3d_SlaveZero.exe", 0xDC2C4;
    string3 mission:         "d3d_SlaveZero.exe", 0xDC2C4;
    bool    loading:         "d3d_SlaveZero.exe", 0xE5FCC;
    float   finalBossHealth: "d3d_SlaveZero.exe", 0xE98F4, 0x88;
}

startup
{
    settings.Add("Missions", true, "Split every mission");
    settings.Add("Levels", true, "Split every level", "Missions");
}

init
{
    vars.completedSplits = new List<string>();
}

start
{
    if (old.loading == false && current.loading == true && current.level == "M01_A")
    {
        vars.completedSplits.Add(current.level);
        return true;
    }
}

split
{
    if (old.level != current.level && !vars.completedSplits.Contains(current.level))
    {
        vars.completedSplits.Add(current.level);

        if (old.mission != current.mission)
        {
            return settings["Missions"]; 
        }
        return settings["Levels"];
    }

    return current.level == "M15_C" && !current.loading && old.finalBossHealth > 0 && current.finalBossHealth < 0;
}

isLoading
{
    return current.loading;
}

onReset
{
    vars.completedSplits.Clear();
}