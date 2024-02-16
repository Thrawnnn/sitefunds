net.Receive("OpenVendor", function()
    vgui.Create("basicFrame")
end)

net.Receive("OpenCmdModule", function()
    vgui.Create("CmdModule")
end)

net.Recieve("OpenHelpDesk", function()
    vgui.Create("help")
end)