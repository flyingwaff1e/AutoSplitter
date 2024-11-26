state("ChildrenOfTheSun") { }

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Children of the Sun";
}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono => {

        vars.Helper["loading"] = mono.Make<bool>("GameManager", "gm", "loading");
        vars.Helper["carChase"] = mono.Make<bool>("GameManager", "gm", "lm", "carChase");
        vars.Helper["carChaseDone"] = mono.Make<bool>("GameManager", "gm", "carChaseDone");
        vars.Helper["levelStarted"] = mono.Make<bool>("GameManager", "gm", "lm", "levelStarted");
        vars.Helper["targetsToHit"] = mono.Make<byte>("GameManager", "gm", "lm", "targetsToHit", 0x18);

        return true;
    });
}

start
{
    return (!current.loading && current.levelStarted && !old.levelStarted && current.targetsToHit > 0) || 
    (!current.loading && old.loading && current.levelStarted && current.targetsToHit > 0);
}

split
{
    return current.targetsToHit == 0 && old.targetsToHit > 0 && !current.loading;
}

isLoading
{
    if (!current.carChase || current.carChaseDone) {
        return (current.loading || !current.levelStarted || current.targetsToHit == 0);
    } else {
        return current.loading || !current.levelStarted;
    }
}
