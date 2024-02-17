net.Receive("OpenVendor", function()
    surface.PlaySound("bms_objects/clickbeep/portablebattery_beep01.wav")
    vgui.Create("basicFrame")
end)

net.Receive("OpenCmdModule", function()
    surface.PlaySound("weapons/pprptab/startup.wav")
    vgui.Create("CmdModule")
end)

net.Receive("OpenHelpDesk", function()
    surface.PlaySound("dynamicnames/tadah_pingpingping.mp3")
    vgui.Create("HelpDesk")
end)