-- 2021-07-09: Base aiBrain is 4057 without UVESO, 4449 lines long with?
local SpawnMain = import('/mods/SpawnACU/lua/SpawnMain.lua')

SpawnACUAIBrainClass = AIBrain
AIBrain = Class(SpawnACUAIBrainClass) {

    OnDefeat = function(self)
        ForkThread(M27Events.OnPlayerDefeated, self)
        SpawnACUAIBrainClass.OnDefeat(self)
    end,

    -- Hook m27AI and record it as being used

    OnCreateAI = function(self, planName)
        if string.find(ScenarioInfo.ArmySetup[self.Name].AIPersonality, 'SpawnACU') then
            ForkThread(SpawnMain.TransferACU, self)
            --SpawnACUAIBrainClass.OnCreateAI(self, planName)

        else
            SpawnACUAIBrainClass.OnCreateAI(self, planName)
        end
    end,
}

