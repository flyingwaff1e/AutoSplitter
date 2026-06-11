state("MotorSlice-Win64-Shipping", "Unknown") { }

state("MotorSlice-Win64-Shipping", "05.05") //Release
{
    // UWorld

    // AMyGameMode_C : public AGameModeBase

    // -> ACheckpoint_C -> LevelID
	int  Checkpoint : "MotorSlice-Win64-Shipping.exe", 0x08FDD780, 0x1A8, 0x388, 0x2F0;
    
    // UGameInstance -> ULocalPlayer -> UPlayer -> 0x0 (First Item) -> APlayerController -> APawn -> AController -> AMainChar_C : public ACharacter
    byte randomWake : "MotorSlice-Win64-Shipping.exe", 0x08FDD780, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2BA4;
    byte isCutscene : "MotorSlice-Win64-Shipping.exe", 0x08FDD780, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2CD4;
    bool Event      : "MotorSlice-Win64-Shipping.exe", 0x08FDD780, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x1D80;
}

state("MotorSlice-Win64-Shipping", "10.05") //1.01
{
    int  Checkpoint : "MotorSlice-Win64-Shipping.exe", 0x08FDB980, 0x1A8, 0x388, 0x2F0;
    byte randomWake : "MotorSlice-Win64-Shipping.exe", 0x08FDB980, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2BA4;
    byte isCutscene : "MotorSlice-Win64-Shipping.exe", 0x08FDB980, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2CD4;
    bool Event      : "MotorSlice-Win64-Shipping.exe", 0x08FDB980, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x1D80;
}

state("MotorSlice-Win64-Shipping", "11.05") //1.01 Updated
{
    int  Checkpoint : "MotorSlice-Win64-Shipping.exe", 0x08FDD980, 0x1A8, 0x388, 0x2F0;
    byte randomWake : "MotorSlice-Win64-Shipping.exe", 0x08FDD980, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2BA4;
    byte isCutscene : "MotorSlice-Win64-Shipping.exe", 0x08FDD980, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2CD4;
    bool Event      : "MotorSlice-Win64-Shipping.exe", 0x08FDD980, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x1D80;
}

state("MotorSlice-Win64-Shipping", "29.05") //1.05
{
    int  Checkpoint : "MotorSlice-Win64-Shipping.exe", 0x08FF1AC0, 0x1A8, 0x388, 0x2F0;
    byte randomWake : "MotorSlice-Win64-Shipping.exe", 0x08FF1AC0, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2B84;
    byte isCutscene : "MotorSlice-Win64-Shipping.exe", 0x08FF1AC0, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2CB4;
    bool Event      : "MotorSlice-Win64-Shipping.exe", 0x08FF1AC0, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x1D70;
}

state("MotorSlice-Win64-Shipping", "06.06") //1.05 Updated
{
    int  Checkpoint : "MotorSlice-Win64-Shipping.exe", 0x08FF1AC0, 0x1A8, 0x388, 0x2F0;
    byte randomWake : "MotorSlice-Win64-Shipping.exe", 0x08FF1AC0, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2B84;
    byte isCutscene : "MotorSlice-Win64-Shipping.exe", 0x08FF1AC0, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x2CB4;
    bool Event      : "MotorSlice-Win64-Shipping.exe", 0x08FF1AC0, 0x228, 0x38, 0x0, 0x30, 0x358, 0x2E8, 0x300, 0x1D70;
}

startup
{
    vars.SetTextComponent = (Action<string, string>)((id, text) =>
	{
        var textSettings = timer.Layout.Components.Where(x => x.GetType().Name == "TextComponent").Select(x => x.GetType().GetProperty("Settings").GetValue(x, null));
        var textSetting = textSettings.FirstOrDefault(x => (x.GetType().GetProperty("Text1").GetValue(x, null) as string) == id);
        if (textSetting == null)
        {
            var textComponentAssembly = Assembly.LoadFrom("Components\\LiveSplit.Text.dll");
            var textComponent = Activator.CreateInstance(textComponentAssembly.GetType("LiveSplit.UI.Components.TextComponent"), timer);
            timer.Layout.LayoutComponents.Add(new LiveSplit.UI.Components.LayoutComponent("LiveSplit.Text.dll", textComponent as LiveSplit.UI.Components.IComponent));
            textSetting = textComponent.GetType().GetProperty("Settings", BindingFlags.Instance | BindingFlags.Public).GetValue(textComponent, null);
            textSetting.GetType().GetProperty("Text1").SetValue(textSetting, id);
        }
        if (textSetting != null)
            textSetting.GetType().GetProperty("Text2").SetValue(textSetting, text);
	});

    settings.Add("CH_Track", false, "Show active checkpoint");
    settings.Add("CH_Split", false, "Split every checkpoint");
    settings.Add("CH_Start", false, "Start after loading a checkpoint");
}

init
{
    string hash;
    using (var md5 = System.Security.Cryptography.MD5.Create())
    using (var fs = File.OpenRead(modules.First().FileName))
    hash = string.Concat(md5.ComputeHash(fs).Select(b => b.ToString("X2")));

    switch (hash)
    {
        case "70BA48E000D9451F3B38B143AFD5971C":
            version = "05.05";
            break;
        case "50077C694D839D01B9C9D08A10C17F41":
            version = "10.05";
            break;
        case "A8CFB844645FC4E241ED61B12C627F13":
            version = "11.05";
            break;
        case "D795100F0A78D90DEE365D553696B162":
            version = "29.05";
            break;   
        case "7D6054C1551E8120E925F0D4086F246B":
            version = "06.06";
            break;
        default:
            version = "Unknown";
            break;
    }
}

update
{
    if(settings["CH_Track"])
		vars.SetTextComponent("Checkpoint: ", (current.Checkpoint).ToString());
}

split
{
    if (current.Checkpoint == 9001 && old.isCutscene == 0 && current.isCutscene == 1)
        return true;

    if (old.Checkpoint != current.Checkpoint && current.Checkpoint > 0 && old.Checkpoint > 0)
        return settings["CH_Split"];
}

start
{
    if (current.Checkpoint == 1 && old.isCutscene == 0 && current.isCutscene == 1)
        return true;
        
    if (current.randomWake >= 0 && current.Checkpoint > 0 && current.Event == false && old.Event == true)
        return settings["CH_Start"];
}
