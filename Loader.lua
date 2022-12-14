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
                    if args[3]["MouseHit"] and (SaveSettings["Main"]["AutoSecondSea"] or SaveSettings["Main"]["AutoFarmLevel"] or SaveSettings["Dungeon"]["AutoDungeon"] or SaveSettings["Main"]["AutoKingSamurai"] or SaveSettings["Main"]["AutoSaber"] or SaveSettings["Main"]["AutoGhostShip"] or SaveSettings["Main"]["AutoSeaking"] or SaveSettings["Main"]["AutoOniMask"] or SaveSettings["Main"]["AutoTenguMask"] or SaveSettings["Main"]["AutoFarmBosses"] or SaveSettings["Main"]["AutoKaido"] or SaveSettings["Main"]["MsMother"] or SaveSettings["Main"]["AutoMomBlade"] or SaveSettings["Main"]["AutoHydra"] or SaveSettings["Main"]["AutoLeeQuest"]) and MobP then
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
