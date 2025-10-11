state("SKATESTORY") { }

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Skate Story";
    vars.Helper.LoadSceneManager = true;

    vars.Helper.AlertLoadless();

    settings.Add("ch1-titlecard",        false,     "Prologue");
    settings.Add("ch1-04-eyesawake",     false,     "Enter Ollie Tutorial");
    settings.Add("ch1-06-mooncore",      false,     "Enter Moon Fight");
    settings.Add("ch1-09-lyceum",        false,     "Enter Lyceum");
    settings.Add("ch1-11-B1",            false,     "Enter Thinkpiece Portal");
    settings.Add("B1-Lyceum",            false,     "Back to Lyceum");
    settings.Add("ch1-12-boss",          false,     "Enter Rhetorium");

    vars.usedScenes = new List<string>() {};
}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono => {

        vars.Helper["loading"] = mono.Make<bool>("MultiScene", "isLoading");

        return true;
    });
}

update
{
    current.activeScene = vars.Helper.Scenes.Active.Name ?? current.activeScene;
}

start
{
    return current.activeScene == "ch1-00-title";
}

onStart
{
    vars.usedScenes.Clear();
}

split
{
    if (old.activeScene != current.activeScene) {

        if (old.activeScene == "ch1-11-B1" && current.activeScene == "ch1-09-lyceum")
            return settings["B1-Lyceum"];

        if (current.activeScene == "_DemoFinish")
            return true;

        if (settings[current.activeScene] && !vars.usedScenes.Contains(current.activeScene)) {
            vars.usedScenes.Add(current.activeScene);
            return true;
        }
    }
}

isLoading
{
    return current.loading;
}