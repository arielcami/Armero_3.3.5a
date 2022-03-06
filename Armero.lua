--[[
    Ariel Camilo // ariel.cami@gmail.com // 3 de Marzo 2022

    Si ya entrenaste tus armas, puedes volver otra vez con más nivel para subir al máximo tus skills de armas.

]]
local NPCID = 00000  --> Reemplaza 00000 con el ID del NPC al que asignarás el script.
local hab,L15 = 'Espero que des buen uso a tus nuevas habilidades.','Debes ser al menos nivel 15, '
local SKILLS_ = {[1]={264,2567,200,266,5011,1180,201,202,196,197,198,199},[2]={200,201,202,196,197,198,199},[4]={264,2567,200,266,5011,227,1180,201,202,196,197},
[8]={264,2567,266,5011,1180,201,196,198},[16]={227,1180,198,5009},[32]={200,201,202,196,197,198,199},[64]={227,1180,196,197,198,199,15590},[128]={227,1180,201,5009},
[256]={227,1180,201,5009},[1024]={200,227,1180,198,199,15590}}

local function ClickNPC(E, P, U)  local L, C, name = P:GetLevel(), P:GetClassMask(), P:GetName()

    local function Has() 
        for i=1, #SKILLS_[C] do 
            if P:HasSpell(SKILLS_[C][i]) then 
                return true 
            else 
                return false 
            end 
        end 
    end

    local function LEARN() 
            if L <= 14 then U:SendUnitSay(L15..name..'.',0)
        elseif L >= 15 then 
            if (Has() == true) then 
                U:SendUnitSay('No tengo nada que enseñarte, '..name,0) P:AdvanceSkillsToMax() 
            else
                U:SendUnitSay(hab,0) P:AdvanceSkillsToMax() for i=1, #SKILLS_[C] do P:LearnSpell(SKILLS_[C][i]) end 
            end
        end
    end    
    LEARN() 
end
RegisterCreatureGossipEvent(NPCID, 1, ClickNPC)