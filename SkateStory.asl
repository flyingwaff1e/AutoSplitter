state("SKATESTORY") { }

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Skate Story";
    vars.Helper.LoadSceneManager = true;

    vars.Helper.AlertLoadless();

    settings.Add("endplates", false, "Split chapters");
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

split
{
    if (old.activeScene != current.activeScene) {

        if (current.activeScene == "_CreditsScroll")
            return true;

        if (current.activeScene.Contains("endplate"))
            return settings["endplates"];
    }
}

isLoading
{
    return current.loading;
}
