state("I Am Your Beast") { }

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "I Am Your Beast";

    settings.Add("ILs", false, "Start timer on every level (for ILs)");
}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono => {

        //Level states: 0 - intro; 1 - active; 2 - completed; 3 - failed.
        vars.Helper["levelState"] = mono.Make<byte>("GameManager", "instance", "levelController", "levelState");

        //Transition states: 0 - TransitioningOut; 1 - Holding; 2 - TransitioningIn.
        //Timer pauses during 0 and 1 since the player can't control Harding during those states.
        vars.Helper["sceneTransition"] = mono.Make<byte>("GameManager", "instance", "activeSceneTransition", "state");

        //Tracks if player is active. Makes split starts more precise.
        vars.Helper["tracking"] = mono.Make<bool>("GameManager", "instance", "levelController", "gameplayTracker", "tracking");

        //Technically a transition destination, but works as a current scene
        vars.Helper["destination"] = mono.MakeString("GameManager", "instance", "activeSceneTransition", "destination");

        //#25 Mercy split
        vars.Helper["cutsceneID"] = mono.Make<byte>("GameManager", "instance", "cutsceneInfoStorer", "sequence", "ID");

        return true;
    });
}

isLoading
{
    if (current.destination == "Scenes/!___STORY SCENES/#01a_Special_Tutorial" || current.destination == "#01c_Special_Tutorial") {
        return current.sceneTransition != 2;
    };

    return current.sceneTransition != 2 || current.destination == "Scenes/UI/Menus/LevelSelect" || current.levelState == 2 || current.levelState == 0;
}

start
{
    if (settings["ILs"] == true) {
        return current.sceneTransition == 2 && old.tracking == false && current.tracking == true;
    } else {
        return current.sceneTransition == 2 && old.tracking == false && current.tracking == true && current.destination == "Scenes/!___STORY SCENES/#01a_Special_Tutorial";
    };
}

split
{
    if (current.cutsceneID == 22 && old.destination == "Scenes/UI/Cutscenes/Cutscene") {
        return old.destination == "Scenes/UI/Cutscenes/Cutscene" && current.destination == "Scenes/UI/Menus/LevelSelect";
    } else {
        return (old.destination == "#01c_Special_Tutorial" && current.destination == "Scenes/UI/Menus/LevelSelect") || (old.levelState == 1 && current.levelState == 2);
    };
}
