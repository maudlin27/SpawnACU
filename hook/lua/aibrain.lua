local SpawnMain = import('/mods/SpawnACU/lua/SpawnMain.lua')

SpawnACUAIBrainClass = AIBrain
AIBrain = Class(SpawnACUAIBrainClass) {

    --[[OnDefeat = function(self)
        ForkThread(M27Events.OnPlayerDefeated, self)
        SpawnACUAIBrainClass.OnDefeat(self)
    end,--]]

    OnCreateAI = function(self, planName)
        LOG('OnCreateAI hook for ai with personality '..ScenarioInfo.ArmySetup[self.Name].AIPersonality)
        if ScenarioInfo.ArmySetup[self.Name].AIPersonality == 'spawnacu' then
            LOG('Forked transfer ACU')
            ForkThread(SpawnMain.TransferACU, self)
            --SpawnACUAIBrainClass.OnCreateAI(self, planName)

        else
            SpawnACUAIBrainClass.OnCreateAI(self, planName)
        end
    end,
}

