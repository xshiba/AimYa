task.spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg,false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "InvokeServer" then
            if tostring(args[1]) == "SkillAction" then
                if (args[3]) then
                    if args[3]["MouseHit"] and (_G.Settings.AutoFarmLevel or _G.Settings.AutoSeaKing or _G.Settings.AutoHydra or _G.Settings.AutoGhostShip or _G.Settings.AutoFarmBosses or _G.Settings.AutoFindItems or _G.Settings.AutoFarmPlayers or _G.Settings.AimbotSkills or _G.Settings.AutoFarmDungeon) and MobP then
                        pcall(function()
                            args[3]["MouseHit"] = MobP
                            return old(unpack(args))
                        end)
                    end
                end
            end
        end
        return old(...)
    end)
end)
